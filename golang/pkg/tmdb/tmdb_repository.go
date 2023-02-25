package tmdb

import (
	"github.com/ryanbradynd05/go-tmdb"
)

var tmdbAPI *tmdb.TMDb

type ITMDbRepository interface {
	GetMovieInfo(opt map[string]string) (*tmdb.Movie, error)
	GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error)
}

type TMDbRepository struct {
}

func NewTMDbRepository() *TMDbRepository {
	config := tmdb.Config{
		APIKey:   "7d2b91f400ce0e8625786102fdf95451",
		Proxies:  nil,
		UseProxy: false,
	}
	tmdbAPI = tmdb.Init(config)
	return &TMDbRepository{}
}

func (repo TMDbRepository) GetMovieInfo(opt map[string]string) (*tmdb.Movie, error) {
	spanishFightClub, err := tmdbAPI.GetMovieInfo(550, opt)
	return spanishFightClub, err
}

func (repo TMDbRepository) GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error) {
	spanishFightClub, err := tmdbAPI.GetMoviePopular(opt)
	return spanishFightClub, err
}
