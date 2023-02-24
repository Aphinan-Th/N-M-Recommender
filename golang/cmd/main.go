package main

import (
	"net/http"

	tmdbhandler "github.com/aphinan633040184-9/golang-basic/handler/tmdb-handler.go"
	"github.com/aphinan633040184-9/golang-basic/handler/todohandler"
	"github.com/aphinan633040184-9/golang-basic/handler/userhandler"
	"github.com/gin-gonic/gin"
)

func main() {

	// var tmdbAPI *tmdb.TMDb
	r := gin.Default()

	// config := tmdb.Config{
	// 	APIKey:   "7d2b91f400ce0e8625786102fdf95451",
	// 	Proxies:  nil,
	// 	UseProxy: false,
	// }

	// tmdbAPI = tmdb.Init(config)

	// var options = make(map[string]string)
	// options["language"] = "es"
	// spanishFightClub, err := tmdbAPI.GetMovieInfo(550, options)
	// fightClubJson, err := tmdb.ToJSON(spanishFightClub)
	// fmt.Println("===========================================")
	// fmt.Println(fightClubJson)
	// fmt.Println(err)

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
	r.GET("/user", userhandler.GetAllUser)
	r.POST("/user", userhandler.PostUser)
	r.GET("/tmdb", tmdbhandler.GetMovieInfo)

	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
