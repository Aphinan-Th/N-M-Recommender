package tmdb

import (
	"fmt"

	"github.com/ryanbradynd05/go-tmdb"
)

var tmdbAPI *tmdb.TMDb

type ITMDbRepository interface {
	GetMovieInfo(id int, opt map[string]string) (*tmdb.Movie, error)
	GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error)
	GetMovieRecommendations(id int, opt map[string]string) (*tmdb.MovieRecommendations, error)
	GetMovieUpcoming(opt map[string]string) (*tmdb.MovieDatedResults, error)
	GetMovieTopRated(opt map[string]string) (*tmdb.MoviePagedResults, error)
	GetMovieByGenres(genre string, page string) (*tmdb.MoviePagedResults, error)
	GetMovieReviews(id int, opt map[string]string) (*tmdb.MovieReviews, error)
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

func (repo TMDbRepository) GetMovieInfo(id int, opt map[string]string) (*tmdb.Movie, error) {
	result, err := tmdbAPI.GetMovieInfo(id, opt)
	return result, err
}

func (repo TMDbRepository) GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error) {
	result, err := tmdbAPI.GetMoviePopular(opt)
	return result, err
}

func (repo TMDbRepository) GetMovieRecommendations(id int, opt map[string]string) (*tmdb.MovieRecommendations, error) {
	result, err := tmdbAPI.GetMovieRecommendations(id, opt)
	return result, err
}

func (repo TMDbRepository) GetMovieUpcoming(opt map[string]string) (*tmdb.MovieDatedResults, error) {
	result, err := tmdbAPI.GetMovieUpcoming(opt)
	return result, err
}

func (repo TMDbRepository) GetMovieTopRated(opt map[string]string) (*tmdb.MoviePagedResults, error) {
	result, err := tmdbAPI.GetMovieTopRated(opt)
	return result, err
}

func (repo TMDbRepository) GetMovieReviews(id int, opt map[string]string) (*tmdb.MovieReviews, error) {
	result, err := tmdbAPI.GetMovieReviews(id, opt)
	return result, err
}

func (repo TMDbRepository) GetMovieGenres() (*tmdb.Genre, error) {
	uri := fmt.Sprintf("%s/genre/movie/list?api_key=%s&language=en-US", baseURL, ApiKey)
	var genres tmdb.Genre
	result, err := getTmdb(uri, &genres)
	return result.(*tmdb.Genre), err
}

func (repo TMDbRepository) GetMovieByGenres(genre string, page string) (*tmdb.MoviePagedResults, error) {
	uri := fmt.Sprintf("%s/discover/movie?api_key=%s&with_genres=%s&page=%s", baseURL, ApiKey, genre, page)
	var genres tmdb.MoviePagedResults
	result, err := getTmdb(uri, &genres)
	return result.(*tmdb.MoviePagedResults), err
}

// https://api.themoviedb.org/3/discover/movie?api_key=7d2b91f400ce0e8625786102fdf95451&with_genres=27
