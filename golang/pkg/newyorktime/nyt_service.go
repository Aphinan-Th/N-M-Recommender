package nyt

import "github.com/aphinan633040184-9/golang-basic/pkg/model"

type INYTService interface {
	GetMostpopular() (*model.NewyorkTime, error)
}

type NYTService struct {
	NYTRepository INYTRepository
}

func NewNYTService() *NYTService {
	return &NYTService{
		NYTRepository: NewNYTRepository(),
	}
}
func (service *NYTService) GetMostpopular() (*model.NewyorkTime, error) {
	result, err := service.NYTRepository.GetMostpopular()
	return result, err
}
