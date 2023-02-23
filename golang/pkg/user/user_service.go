package user

import "github.com/aphinan633040184-9/golang-basic/pkg/model"

type IUserService interface {
	GetAllUser() ([]model.User, error)
	SignIn(user model.User) (model.User, error)
	LogIn(user model.UserLogin) (model.UserLogin, error)
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

func (service *UserService) SignIn(user model.User) (model.User, error) {
	result, err := service.UserRepository.SignIn(user)
	return result, err
}

func (service *UserService) LogIn(user model.UserLogin) (model.UserLogin, error) {
	result, err := service.UserRepository.LogIn(user)
	return result, err
}
