package fav

import "github.com/aphinan633040184-9/golang-basic/pkg/model"

type IFavoriteService interface {
	GetAllFavorite() ([]model.MyFavorite, error)
	InsertFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error)
	GetFavoriteByUserId(userId string) ([]model.MyFavorite, error)
	DeleteFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error)
}

type FavoriteService struct {
	FavoriteRepository IFavoriteRepository
}

func NewFavoriteService() *FavoriteService {
	return &FavoriteService{
		FavoriteRepository: NewFavoriteRepository(),
	}
}

func (service *FavoriteService) GetAllFavorite() ([]model.MyFavorite, error) {
	result, err := service.FavoriteRepository.GetAllFavorite()
	return result, err
}

func (service *FavoriteService) InsertFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error) {
	result, err := service.FavoriteRepository.InsertFavorite(myFavorite)
	return result, err
}

func (service *FavoriteService) GetFavoriteByUserId(userId string) ([]model.MyFavorite, error) {
	result, err := service.FavoriteRepository.GetFavoriteByUserId(userId)
	return result, err
}

func (service *FavoriteService) DeleteFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error) {
	result, err := service.FavoriteRepository.DeleteFavorite(myFavorite)
	return result, err
}
