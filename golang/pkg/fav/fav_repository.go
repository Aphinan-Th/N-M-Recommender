package fav

import (
	"context"
	"log"

	"github.com/aphinan633040184-9/golang-basic/constant"
	"github.com/aphinan633040184-9/golang-basic/pkg/model"
	"github.com/aphinan633040184-9/golang-basic/pkg/mongoconnection"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

type IFavoriteRepository interface {
	GetAllFavorite() ([]model.MyFavorite, error)
	InsertFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error)
	GetFavoriteByUserId(userId string) ([]model.MyFavorite, error)
	DeleteFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error)
}

type FavoriteRepository struct {
}

func NewFavoriteRepository() *FavoriteRepository {
	return &FavoriteRepository{}
}

func (repo FavoriteRepository) getCollection() *mongo.Collection {
	return repo.getDBService().Database.Collection(constant.FavoriteCollection)
}

func (repo FavoriteRepository) getDBService() *mongoconnection.DatabaseService {
	dbService := mongoconnection.DatabaseService{
		DatabaseName: constant.DatabaseName,
	}

	if cache := dbService.GetCache(); cache != nil {
		return cache
	}

	// New connection
	if err := dbService.NewService(); err != nil {
		log.Fatal(err)
	}

	return dbService.GetCache()
}

func (repo *FavoriteRepository) GetAllFavorite() ([]model.MyFavorite, error) {
	Favorites := []model.MyFavorite{}

	query := bson.D{{}}

	cursor, err := repo.getCollection().Find(context.TODO(), query)
	if err != nil {
		return []model.MyFavorite{}, nil
	}

	if err = cursor.All(context.Background(), &Favorites); err != nil {
		return []model.MyFavorite{}, nil
	}

	return Favorites, nil
}

func (repo *FavoriteRepository) GetFavoriteByUserId(userId string) ([]model.MyFavorite, error) {
	fav := []model.MyFavorite{}
	results, err := repo.GetAllFavorite()
	if err != nil {
		return []model.MyFavorite{}, err
	}
	for _, data := range results {
		if data.UserID == userId {
			fav = append(fav, data)
		}
	}
	return fav, nil
}

func (repo *FavoriteRepository) InsertFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error) {
	favorites, err := repo.GetAllFavorite()
	for _, alreadyFav := range favorites {
		if alreadyFav.Favorite.ID == myFavorite.Favorite.ID && alreadyFav.UserID == myFavorite.UserID {
			return model.MyFavorite{}, err
		}
	}
	result, err := repo.getCollection().InsertOne(context.TODO(), myFavorite)
	if err != nil {
		return model.MyFavorite{}, err
	}

	myFavorite.ID = result.InsertedID.(primitive.ObjectID)
	return myFavorite, err
}

func (repo *FavoriteRepository) DeleteFavorite(myFavorite model.MyFavorite) (model.MyFavorite, error) {
	favorites, err := repo.GetAllFavorite()
	for _, alreadyFav := range favorites {
		if alreadyFav.Favorite.ID == myFavorite.Favorite.ID && alreadyFav.UserID == myFavorite.UserID {
			_, err := repo.getCollection().DeleteOne(context.TODO(), myFavorite)
			if err != nil {
				return model.MyFavorite{}, err
			}
		}
	}
	return myFavorite, err
}
