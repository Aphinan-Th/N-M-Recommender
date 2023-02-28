package model

import "go.mongodb.org/mongo-driver/bson/primitive"

type User struct {
	ID            primitive.ObjectID `json:"id,omitempty" bson:"_id,omitempty"`
	Username      string             `json:"username" bson:"username" validate:"required, min=2, max=100"`
	Email         string             `json:"email" bson:"email" validate:"email, required"`
	Password      string             `json:"password" bson:"password" validate:"required, min=6"`
	Token         string             `json:"token" bson:"token"`
	Refresh_token string             `json:"refresh_token" bson:"refresh_token"`
	User_Id       string             `json:"user_id" bson:"user_id"`
}

type UserLogin struct {
	Email    string `json:"email" bson:"email" validate:"email, required"`
	Password string `json:"password" bson:"password" validate:"required, min=6"`
}
