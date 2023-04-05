package tmdb

import "github.com/ryanbradynd05/go-tmdb"

type ITMDbService interface {
	GetMovieInfo(id int, opt map[string]string) (*tmdb.Movie, error)
	GetMoviePopular(opt map[string]string) (*tmdb.MoviePagedResults, error)
	GetMovieRecommendations(id int, opt map[string]string) (*tmdb.MovieRecommendations, error)
	GetMovieUpcoming(opt map[string]string) (*tmdb.MovieDatedResults, error)
	GetMovieTopRated(opt map[string]string) (*tmdb.MoviePagedResults, error)
	GetMovieGenres() (*tmdb.Genre, error)
	GetMovieByGenres(genre string, page string) (*tmdb.MoviePagedResults, error)
	GetMovieReviews(id int, opt map[string]string) (*tmdb.MovieReviews, error)
}

type TMDbService struct {
	TMDbRepository ITMDbService
}

func NewTMDbService() *TMDbService {
	return &TMDbService{
		TMDbRepository: NewTMDbRepository(),
	}
}

func (service *TMDbService) GetMovieInfo(id int, opt map[string]string) (*tmdb.Movie, error) {
	result, err := service.TMDbRepository.GetMovieInfo(id, opt)
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

func (service *TMDbService) GetMovieGenres() (*tmdb.Genre, error) {
	result, err := service.TMDbRepository.GetMovieGenres()
	return result, err
}
func (service *TMDbService) GetMovieByGenres(genre string, page string) (*tmdb.MoviePagedResults, error) {
	result, err := service.TMDbRepository.GetMovieByGenres(genre, page)
	return result, err
}

func (service *TMDbService) GetMovieReviews(id int, opt map[string]string) (*tmdb.MovieReviews, error) {
	result, err := service.TMDbRepository.GetMovieReviews(id, opt)
	return result, err
}
