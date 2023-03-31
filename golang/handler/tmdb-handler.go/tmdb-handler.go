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
	opt := make(map[string]string)
	query := c.Query("page")
	opt["page"] = query

	result, err := handler.TMDbService.GetMoviePopular(opt)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *TMDbHandler) GetMovieRecommendationsPopular(c *gin.Context) {
	opt := make(map[string]string)
	query := c.Query("page")
	id := 3
	opt["page"] = query

	result, err := handler.TMDbService.GetMovieRecommendations(id, opt)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *TMDbHandler) GetMovieUpcoming(c *gin.Context) {
	opt := make(map[string]string)
	query := c.Query("page")
	opt["page"] = query

	result, err := handler.TMDbService.GetMovieUpcoming(opt)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *TMDbHandler) GetMovieTopRated(c *gin.Context) {
	opt := make(map[string]string)
	query := c.Query("page")
	opt["page"] = query

	result, err := handler.TMDbService.GetMovieTopRated(opt)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}
