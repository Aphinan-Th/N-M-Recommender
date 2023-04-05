package model

import "go.mongodb.org/mongo-driver/bson/primitive"

type User struct {
	ID       primitive.ObjectID `json:"id,omitempty" bson:"_id,omitempty"`
	Username string             `json:"username" bson:"username" validate:"required, min=2, max=100"`
	Email    string             `json:"email" bson:"email" validate:"email, required"`
	Password string             `json:"password" bson:"password" validate:"required, min=6"`
	Token    string             `json:"token" bson:"token"`
}

type UserLogin struct {
	Email    string `json:"email" bson:"email" validate:"email, required"`
	Password string `json:"password" bson:"password" validate:"required, min=6"`
}

type ChangePassword struct {
	ID          string `json:"_id" bson:"_id"`
	OldPassword string `json:"old_password" bson:"old_password" validate:"required, min=6"`
	NewPassword string `json:"new_password" bson:"new_password" validate:"required, min=6"`
}

type Status struct {
	User_Id     primitive.ObjectID `json:"id,omitempty" bson:"_id,omitempty"`
	Status      string
	ErrorString string
}
