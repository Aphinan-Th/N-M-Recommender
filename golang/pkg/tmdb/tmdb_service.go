package tmdb

import "github.com/ryanbradynd05/go-tmdb"

type ITMDbService interface {
	GetMovieInfo(opt map[string]string) (*tmdb.Movie, error)
	GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error)
	GetMovieRecommendations(id int, opt map[string]string) (*tmdb.MovieRecommendations, error)
	GetMovieUpcoming(opt map[string]string) (*tmdb.MovieDatedResults, error)
	GetMovieTopRated(opt map[string]string) (*tmdb.MoviePagedResults, error)
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
func (service *TMDbService) GetMovieUpcoming(opt map[string]string) (*tmdb.MovieDatedResults, error) {
	result, err := service.TMDbRepository.GetMovieUpcoming(opt)
	return result, err
}
func (service *TMDbService) GetMovieTopRated(opt map[string]string) (*tmdb.MoviePagedResults, error) {
	result, err := service.TMDbRepository.GetMovieTopRated(opt)
	return result, err
}
