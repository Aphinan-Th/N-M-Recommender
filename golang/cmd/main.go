package main

import (
	"net/http"

	tmdbhandler "github.com/aphinan633040184-9/golang-basic/handler/tmdb-handler.go"
	"github.com/aphinan633040184-9/golang-basic/handler/todohandler"
	"github.com/aphinan633040184-9/golang-basic/handler/userhandler"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	todohandler := todohandler.NewTodoHandler()
	userhandler := userhandler.NewUserHandler()
	tmdbhandler := tmdbhandler.NewTMDbHandler()

	r.GET("/todo", todohandler.GetAllTodo)
	r.POST("/todo", todohandler.PostTodo)
<<<<<<< HEAD
	// r.GET("/user", userhandler.GetAllUser)
	r.POST("/user", userhandler.SignIn)
	r.GET("/user", userhandler.LogIn)
=======
	r.GET("/user", userhandler.GetAllUser)
	r.POST("/user", userhandler.PostUser)
	r.GET("/tmdb-movie-info", tmdbhandler.GetMovieInfo)
	r.GET("/tmdb-movie-popular/", tmdbhandler.GetMoviePopular)
	r.GET("/tmdb-movie-recommend/", tmdbhandler.GetMovieRecommendationsPopular)
>>>>>>> 4eea4d4de3d1787a27307ccbaf697410584cf8f6

	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
