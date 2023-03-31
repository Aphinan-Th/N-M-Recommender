package user

import (
	"github.com/aphinan633040184-9/golang-basic/pkg/model"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type IUserService interface {
	GetAllUser() ([]model.User, error)
	SignIn(user model.User) (model.User, error)
	LogIn(user model.UserLogin) (model.Status, error)
	UserInfo(userId primitive.ObjectID) (model.User, error)
	ChangePassword(user model.ChangePassword) (model.Status, error)
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

func (service *UserService) LogIn(user model.UserLogin) (model.Status, error) {
	result, err := service.UserRepository.LogIn(user)
	return result, err
}

func (service *UserService) ChangePassword(user model.ChangePassword) (model.Status, error) {
	result, err := service.UserRepository.ChangePassword(user)
	return result, err
}

func (service *UserService) UserInfo(userId primitive.ObjectID) (model.User, error) {
	result, err := service.UserRepository.UserInfo(userId)
	return result, err
}
