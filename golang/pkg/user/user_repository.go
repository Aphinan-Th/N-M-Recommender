package user

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

type IUserRepository interface {
	GetAllUser() ([]model.User, error)
	InsertUser(user model.User) (model.User, error)
}

type UserRepository struct {
}

func NewUserRepository() *UserRepository {
	return &UserRepository{}
}

func (repo UserRepository) getCollection() *mongo.Collection {
	return repo.getDBService().Database.Collection(constant.UserCollection)
}

func (repo UserRepository) getDBService() *mongoconnection.DatabaseService {
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

func (repo *UserRepository) GetAllUser() ([]model.User, error) {
	users := []model.User{}

	query := bson.D{{}}

	cursor, err := repo.getCollection().Find(context.TODO(), query)
	if err != nil {
		return []model.User{}, nil
	}

	if err = cursor.All(context.Background(), &users); err != nil {
		return []model.User{}, nil
	}

	return users, nil
}

func (repo *UserRepository) InsertUser(user model.User) (model.User, error) {
	result, err := repo.getCollection().InsertOne(context.TODO(), user)
	if err != nil {
		return model.User{}, err
	}

	user.ID = result.InsertedID.(primitive.ObjectID)
	return user, err
}
