package model

import (
	"github.com/golang-jwt/jwt/v5"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type TokenClaims struct {
	UserId   primitive.ObjectID `json:"userId" bson:"userId"`
	Username string             `json:"username" bson:"username"`
	Email    string             `json:"email" bson:"email" `
	Token    string             `json:"token" bson:"token"`
	*jwt.RegisteredClaims
}
