package authhandler

import (
	"log"

	"github.com/aphinan633040184-9/golang-basic/pkg/model"
	"github.com/aphinan633040184-9/golang-basic/pkg/token"
	"github.com/aphinan633040184-9/golang-basic/pkg/user"
	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type IAuthHandler interface {
	Login(c *gin.Context)
	GetMe(c *gin.Context)
	SignUp(c *gin.Context)
	ChangePassword(c *gin.Context)
	GetUserInfo(c *gin.Context)
}

type AuthHandler struct {
	TokenService token.ITokenService
	UserService  user.IUserService
}

func NewAuthHandler() IAuthHandler {
	return &AuthHandler{
		TokenService: token.NewTokenService(),
		UserService:  user.NewUserService(),
	}
}

func (handler *AuthHandler) SignUp(c *gin.Context) {
	// login logic here
	var user model.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(500, err)
	}

	result, err := handler.UserService.SignIn(user)
	if err != nil {
		c.JSON(500, err)
	}
	if result.ID == primitive.NilObjectID {
		c.JSON(500, gin.H{"error": "Already have an account? Duplicate Email or Username"})
		return
	}

	accessToken, err := handler.TokenService.GenerateToken(result.ID)
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	result.Token = accessToken

	c.JSON(200, result)
}

func (handler *AuthHandler) Login(c *gin.Context) {
	// login logic here
	var user model.UserLogin
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(500, err)
	}

	result, err := handler.UserService.LogIn(user)
	if err != nil || result.Status != model.Success {
		c.JSON(500, err)
	}

	accessToken, err := handler.TokenService.GenerateToken(result.User_Id)

	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}

	c.JSON(200, gin.H{"accessToken": accessToken})
}

func (handler *AuthHandler) GetMe(c *gin.Context) {
	// login logic here

	userId := c.MustGet("userId")
	c.JSON(200, gin.H{"userId": userId})
}

func (handler *AuthHandler) GetUserInfo(c *gin.Context) {
	str := c.Param("userId")
	id, err := primitive.ObjectIDFromHex(str)
	if err != nil {
		log.Fatal(err)
	}

	result, err := handler.UserService.UserInfo(id)
	if err != nil {
		c.JSON(500, err)
	}
	c.JSON(200, result)
}

func (handler *AuthHandler) ChangePassword(c *gin.Context) {
	var user model.ChangePassword
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(500, err)
	}

	result, err := handler.UserService.ChangePassword(user)
	if err != nil {
		c.JSON(500, err)
	}
	c.JSON(201, result)
}
