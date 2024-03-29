package model

import "go.mongodb.org/mongo-driver/bson/primitive"

type Todo struct {
	ID   primitive.ObjectID `json:"id,omitempty" bson:"_id,omitempty"`
	Name string             `json:"name" bson:"name"`
	Old  int                `json:"old" bson:"old"`
}
