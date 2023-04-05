// To parse and unparse this JSON data, add this code to your project and do:
//
//    favorite, err := UnmarshalFavorite(bytes)
//    bytes, err = favorite.Marshal()

package model

import (
	"encoding/json"

	"go.mongodb.org/mongo-driver/bson/primitive"
)

func UnmarshalFavorite(data []byte) (MyFavorite, error) {
	var r MyFavorite
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *MyFavorite) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type MyFavorite struct {
	ID       primitive.ObjectID `json:"id,omitempty" bson:"_id,omitempty"`
	UserID   string             `json:"userId"`
	Favorite FavoriteDetail     `json:"Favorite"`
}

type FavoriteDetail struct {
	Type string `json:"type"`
	ID   int64  `json:"id"`
}
