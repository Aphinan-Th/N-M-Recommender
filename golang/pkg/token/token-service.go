package token

import (
	"time"

	"github.com/aphinan633040184-9/golang-basic/pkg/model"
	"github.com/golang-jwt/jwt/v5"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type ITokenService interface {
	GenerateToken(userId primitive.ObjectID) (string, error)
	ValidateToken(tokenString string) (*model.TokenClaims, error)
}

type TokenService struct {
}

func NewTokenService() ITokenService {
	return &TokenService{}
}

func (service *TokenService) GenerateToken(userId primitive.ObjectID) (string, error) {

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, model.TokenClaims{
		UserId: userId,
		RegisteredClaims: &jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour * 24)),
		},
	})

	tokenString, err := token.SignedString([]byte("secret"))

	return tokenString, err
}

func (service *TokenService) ValidateToken(tokenString string) (*model.TokenClaims, error) {
	token, err := jwt.ParseWithClaims(tokenString, &model.TokenClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte("secret"), nil
	})

	if err != nil {
		return nil, err
	}

	if claims, ok := token.Claims.(*model.TokenClaims); ok && token.Valid {
		return claims, nil
	}

	return nil, err
}
