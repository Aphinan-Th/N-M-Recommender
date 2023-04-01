package favhandler

import (
	"github.com/aphinan633040184-9/golang-basic/pkg/fav"
	"github.com/aphinan633040184-9/golang-basic/pkg/model"
	"github.com/gin-gonic/gin"
)

type FavoriteHandler struct {
	FavoriteService fav.IFavoriteService
}

func NewFavoriteHandler() *FavoriteHandler {
	return &FavoriteHandler{
		FavoriteService: fav.NewFavoriteService(),
	}
}

func (handler *FavoriteHandler) GetAllFavorite(c *gin.Context) {
	result, err := handler.FavoriteService.GetAllFavorite()
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *FavoriteHandler) GetFavoriteByUserId(c *gin.Context) {
	q := c.Query("userId")
	result, err := handler.FavoriteService.GetFavoriteByUserId(q)
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *FavoriteHandler) PostFavorite(c *gin.Context) {
	var fav model.MyFavorite
	if err := c.ShouldBindJSON(&fav); err != nil {
		c.JSON(500, err)
	}

	result, err := handler.FavoriteService.InsertFavorite(fav)
	if err != nil {
		c.JSON(500, err)
	}
	c.JSON(201, result)
}

func (handler *FavoriteHandler) DeleteFavorite(c *gin.Context) {
	var fav model.MyFavorite
	if err := c.ShouldBindJSON(&fav); err != nil {
		c.JSON(500, err)
	}

	result, err := handler.FavoriteService.DeleteFavorite(fav)
	if err != nil {
		c.JSON(500, err)
	}
	c.JSON(201, result)
}
