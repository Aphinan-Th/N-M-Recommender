package model

import "go.mongodb.org/mongo-driver/bson/primitive"

type User struct {
	ID       primitive.ObjectID `json:"id,omitempty" bson:"_id,omitempty"`
	UserName string             `json:"userName" bson:"userName"`
	Email    string             `json:"email" bson:"email"`
	Password string             `json:"password" bson:"password"`
}
