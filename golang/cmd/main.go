package main

import (
	"net/http"

	"github.com/aphinan633040184-9/golang-basic/handler/todohandler"
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

	r.GET("/todo", todohandler.GetAllTodo)
	r.POST("/todo", todohandler.PostTodo)

	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
