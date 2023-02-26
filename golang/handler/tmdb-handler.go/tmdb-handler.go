package tmdbhandler

import (
	"github.com/aphinan633040184-9/golang-basic/pkg/tmdb"
	"github.com/gin-gonic/gin"
)

type TMDbHandler struct {
	TMDbService tmdb.ITMDbService
}

func NewTMDbHandler() *TMDbHandler {
	return &TMDbHandler{
		TMDbService: tmdb.NewTMDbService(),
	}
}

func (handler *TMDbHandler) GetMovieInfo(c *gin.Context) {
	s := make(map[string]string)
	query := c.Query("name")
	s["name"] = query

	result, err := handler.TMDbService.GetMovieInfo(s)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *TMDbHandler) GetMoviePopular(c *gin.Context) {
	s := make(map[string]string)
	// query := c.Query("name")
	s["language"] = "en"

	result, err := handler.TMDbService.GetMoviePopular(s)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}
