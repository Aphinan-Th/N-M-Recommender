package nythandler

import (
	nyt "github.com/aphinan633040184-9/golang-basic/pkg/newyorktime"
	"github.com/gin-gonic/gin"
)

type NYTHandler struct {
	NYTService nyt.INYTService
}

func NewNYTHandler() *NYTHandler {
	return &NYTHandler{
		NYTService: nyt.NewNYTService(),
	}
}

func (handler *NYTHandler) GetMostpopular(c *gin.Context) {
	result, err := handler.NYTService.GetMostpopular()
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}
