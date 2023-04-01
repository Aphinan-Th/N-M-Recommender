package nyt

import (
	"fmt"

	"github.com/aphinan633040184-9/golang-basic/pkg/model"
)

type INYTRepository interface {
	GetMostpopular() (*model.NewyorkTime, error)
}

type NYTRepository struct {
}

func NewNYTRepository() *NYTRepository {
	return &NYTRepository{}
}

// https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=yourkey
func (repo NYTRepository) GetMostpopular() (*model.NewyorkTime, error) {
	uri := fmt.Sprintf("%s/mostpopular/v2/viewed/1.json?api-key=%s", baseURL, ApiKey)
	var nyt model.NewyorkTime
	result, err := getTmdb(uri, &nyt)
	return result.(*model.NewyorkTime), err
}

// func (repo TMDbRepository) GetMovieGenres() (*tmdb.Genre, error) {
// 	uri := fmt.Sprintf("%s/genre/movie/list?api_key=%s&language=en-US", baseURL, ApiKey)
// 	var genres tmdb.Genre
// 	result, err := getTmdb(uri, &genres)
// 	return result.(*tmdb.Genre), err
// }
