package user

import "github.com/aphinan633040184-9/golang-basic/pkg/model"

type IUserService interface {
	GetAllUser() ([]model.User, error)
	InsertUser(user model.User) (model.User, error)
}

type UserService struct {
	UserRepository IUserRepository
}

func NewUserService() *UserService {
	return &UserService{
		UserRepository: NewUserRepository(),
	}
}

func (service *UserService) GetAllUser() ([]model.User, error) {
	result, err := service.UserRepository.GetAllUser()
	return result, err
}

func (service *UserService) InsertUser(user model.User) (model.User, error) {
	result, err := service.UserRepository.InsertUser(user)
	return result, err
}
