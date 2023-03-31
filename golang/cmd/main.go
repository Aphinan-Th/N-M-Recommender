package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	authhandler "github.com/aphinan633040184-9/golang-basic/handler/auth-handler.go"
	tmdbhandler "github.com/aphinan633040184-9/golang-basic/handler/tmdb-handler.go"
	"github.com/aphinan633040184-9/golang-basic/middleware"
	"github.com/gin-contrib/cors"
	ginzap "github.com/gin-contrib/zap"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

func main() {
	logger, _ := zap.NewProduction()
	r := gin.Default()
	r.Use(ginzap.Ginzap(logger, time.RFC3339, true))
	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"},
		AllowHeaders:     []string{"Access-Control-Allow-Headers", "access-control-allow-origin, access-control-allow-headers", "Content-Type", "X-XSRF-TOKEN", "Accept", "Origin", "X-Requested-With", "Authorization"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	v1 := r.Group("/api/v1")

	auth_handler := authhandler.NewAuthHandler()
	tmdb_handler := tmdbhandler.NewTMDbHandler()
	authRoute := v1.Group("/auth")
	tmdbRoute := v1.Group("/tmdb")

	authRoute.POST("/login", auth_handler.Login)
	authRoute.POST("/sign-up", auth_handler.SignUp)
	authRoute.PATCH("/change-password", auth_handler.ChangePassword)
	authRoute.GET("/me", middleware.ValidationMiddleware, auth_handler.GetMe)
	authRoute.GET("/user-info/:userId", auth_handler.GetUserInfo)

	tmdbRoute.GET("/movie-info", tmdb_handler.GetMovieInfo)
	tmdbRoute.GET("/movie-popular", tmdb_handler.GetMoviePopular)
	tmdbRoute.GET("/movie-recommend", tmdb_handler.GetMovieRecommendationsPopular)
	tmdbRoute.GET("/movie-upcoming", tmdb_handler.GetMovieUpcoming)
	tmdbRoute.GET("/movie-top-rate", tmdb_handler.GetMovieTopRated)

	port := fmt.Sprintf(":%s", "8080")

	srv := &http.Server{
		Addr:    port,
		Handler: r,
	}

	go func() {
		// service connections
		if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed { // listen and serve on 0.0.0.0:8080
			logger.Error("listen: ", zap.Error(err))
		}
	}()

	// Gracefully shutdown the server

	// Wait for interrupt signal to gracefully shutdown the server with
	// a timeout of 5 seconds.
	quit := make(chan os.Signal)

	//lint:ignore SA1017 ignore this!
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	log.Println("Shutdown Server ...")

	ctxR, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := srv.Shutdown(ctxR); err != nil {
		log.Fatal("Server Shutdown:", err)
	}
	log.Println("Server exiting")
}
