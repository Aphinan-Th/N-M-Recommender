package middleware

import (
	"strings"

	"github.com/aphinan633040184-9/golang-basic/pkg/token"
	"github.com/gin-gonic/gin"
)

func ValidationMiddleware(c *gin.Context) {
	tokenService := token.NewTokenService()

	accessToken := strings.Split(c.GetHeader("Authorization"), "Bearer ")[1]

	if accessToken == "" {
		c.JSON(401, gin.H{"error": "Unauthorized"})
		c.Abort()
		return
	}

	claims, err := tokenService.ValidateToken(accessToken)

	if err != nil {
		c.JSON(401, gin.H{"error": "Unauthorized"})
		c.Abort()
		return
	}

	c.Set("userId", claims.UserId)
	c.Next()
}
