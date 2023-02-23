package userhandler

import (
	"github.com/aphinan633040184-9/golang-basic/pkg/model"
	"github.com/aphinan633040184-9/golang-basic/pkg/user"
	"github.com/gin-gonic/gin"
)

type UserHandler struct {
	UserService user.IUserService
}

func NewUserHandler() *UserHandler {
	return &UserHandler{
		UserService: user.NewUserService(),
	}
}

func (handler *UserHandler) GetAllUser(c *gin.Context) {
	result, err := handler.UserService.GetAllUser()
	if err != nil {
		c.JSON(500, gin.H{
			"massage": err.Error(),
		})
	}
	c.JSON(200, result)
}

func (handler *UserHandler) SignIn(c *gin.Context) {
	var user model.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(500, err)
	}

	result, err := handler.UserService.SignIn(user)
	if err != nil {
		c.JSON(500, err)
	}
	c.JSON(201, result)
}

func (handler *UserHandler) LogIn(c *gin.Context) {
	var user model.UserLogin
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(500, err)
	}

	result, err := handler.UserService.LogIn(user)
	if err != nil {
		c.JSON(500, err)
	}
	c.JSON(201, result)
}
