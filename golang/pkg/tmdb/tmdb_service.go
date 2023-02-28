package tmdb

import "github.com/ryanbradynd05/go-tmdb"

type ITMDbService interface {
	GetMovieInfo(opt map[string]string) (*tmdb.Movie, error)
	GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error)
	GetMovieRecommendations(id int, opt map[string]string) (*tmdb.MovieRecommendations, error)
}

type TMDbService struct {
	TMDbRepository ITMDbService
}

func NewTMDbService() *TMDbService {
	return &TMDbService{
		TMDbRepository: NewTMDbRepository(),
	}
}

func (service *TMDbService) GetMovieInfo(opt map[string]string) (*tmdb.Movie, error) {
	result, err := service.TMDbRepository.GetMovieInfo(opt)
	return result, err
}

func (service *TMDbService) GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error) {
	result, err := service.TMDbRepository.GetMoviePopular(opt)
	return result, err
}

func (service *TMDbService) GetMovieRecommendations(id int, opt map[string]string) (*tmdb.MovieRecommendations, error) {
	result, err := service.TMDbRepository.GetMovieRecommendations(id, opt)
	return result, err
}
