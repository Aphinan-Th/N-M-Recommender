package tmdbhandler

import (
	"strconv"

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
	queryId := c.Query("id")
	id, err := strconv.Atoi(queryId)
	if err != nil {
		c.JSON(400, gin.H{
			"message": "Invalid id parameter",
		})
		return
	}
	opt := make(map[string]string)
	opt["language"] = "EN-US"
	result, err := handler.TMDbService.GetMovieInfo(id, opt)
	if err != nil {
		c.JSON(500, gin.H{
			"message": err.Error(),
		})
		return
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

func (handler *TMDbHandler) GetMovieGenres(c *gin.Context) {
	result, err := handler.TMDbService.GetMovieGenres()
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *TMDbHandler) GetMovieByGenre(c *gin.Context) {
	// opt := make(map[string]string)
	id := c.Query("genre_id")
	page := c.Query("page")

	result, err := handler.TMDbService.GetMovieByGenres(id, page)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *TMDbHandler) GetMovieReviews(c *gin.Context) {
	opt := make(map[string]string)
	qid := c.Query("id")
	id, err := strconv.Atoi(qid)
	page := c.Query("page")
	opt["page"] = page
	result, err := handler.TMDbService.GetMovieReviews(id, opt)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}
