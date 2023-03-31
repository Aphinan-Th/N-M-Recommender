package tmdb

import (
	"fmt"

	"github.com/ryanbradynd05/go-tmdb"
)

var tmdbAPI *tmdb.TMDb

const baseURL string = "https://api.themoviedb.org/3"
const ApiKey string = "7d2b91f400ce0e8625786102fdf95451"

type ITMDbRepository interface {
	GetMovieInfo(opt map[string]string) (*tmdb.Movie, error)
	GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error)
	GetMovieRecommendations(id int, opt map[string]string) (*tmdb.MovieRecommendations, error)
	GetMovieUpcoming(opt map[string]string) (*tmdb.MovieDatedResults, error)
	GetMovieTopRated(opt map[string]string) (*tmdb.MoviePagedResults, error)
}

func getOptionsString(options map[string]string, availableOptions map[string]struct{}) string {
	var optionsString = ""
	for key, val := range options {
		if _, ok := availableOptions[key]; ok {
			newString := fmt.Sprintf("%s&%s=%s", optionsString, key, val)
			optionsString = newString
		}
	}
	return optionsString
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
	result, err := tmdbAPI.GetMovieInfo(550, opt)
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

// func (repo TMDbRepository) GetMovieGenres() {
// 	var availableOptions = map[string]struct{}{
// 		"page":     {},
// 		"language": {}}
// 	var popular MoviePagedResults
// 	optionsString := getOptionsString(opt, availableOptions)
// 	uri := fmt.Sprintf("%s/movie/popular?api_key=%s%s", baseURL, ApiKey, optionsString)
// 	result, err := tmdb.getTmdb(uri, &popular)
// 	return result.(*MoviePagedResults), err
// }
