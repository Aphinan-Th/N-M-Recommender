package user

import (
	"context"
	"log"

	"github.com/aphinan633040184-9/golang-basic/constant"
	"github.com/aphinan633040184-9/golang-basic/pkg/model"
	"github.com/aphinan633040184-9/golang-basic/pkg/mongoconnection"
	"github.com/dgrijalva/jwt-go"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

type IUserRepository interface {
	GetAllUser() ([]model.User, error)
	SignIn(user model.User) (model.User, error)
	LogIn(user model.UserLogin) (model.Status, error)
	UserInfo(userId primitive.ObjectID) (model.User, error)
	ChangePassword(user model.ChangePassword) (model.Status, error)
}

type jwtServices struct {
	secretKey string
	issure    string
}
type authCustomClaims struct {
	Name string `json:"name"`
	User bool   `json:"user"`
	jwt.StandardClaims
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

func (repo *UserRepository) UserInfo(userId primitive.ObjectID) (model.User, error) {
	user := model.User{}
	users, err := repo.GetAllUser()
	for _, oldUser := range users {
		if oldUser.ID == userId {
			return oldUser, err
		}
	}
	return user, nil
}

func (repo *UserRepository) SignIn(user model.User) (model.User, error) {

	users, err := repo.GetAllUser()
	for _, oldUser := range users {
		if oldUser.Username == user.Username || oldUser.Email == user.Email {
			return model.User{}, err
		}
	}
	result, err := repo.getCollection().InsertOne(context.TODO(), user)
	if err != nil {
		return model.User{}, err
	}

	user.ID = result.InsertedID.(primitive.ObjectID)
	return user, err
}

func (repo *UserRepository) LogIn(user model.UserLogin) (model.Status, error) {
	status := model.Status{}
	users, err := repo.GetAllUser()
	for _, oldUser := range users {
		if oldUser.Email == user.Email && oldUser.Password == user.Password {
			status = model.Status{Status: model.Success, ErrorString: "nil", User_Id: oldUser.ID}
		} else {
			status = model.Status{Status: model.Failed, ErrorString: "Wrong Email or Password"}
		}
	}
	if err != nil {
		return model.Status{}, err
	}
	return status, err
}

func (repo *UserRepository) ChangePassword(user model.ChangePassword) (model.Status, error) {
	id, err := primitive.ObjectIDFromHex(user.ID)
	if err != nil {
		return model.Status{User_Id: id, Status: "Failed", ErrorString: "Invalid ID"}, err
	}
	filter := bson.M{"_id": id}
	update := bson.M{"$set": bson.M{"password": user.NewPassword}}
	coll := repo.getCollection()
	log.Printf("filter: %v, update: %v\n, coll: %v", filter, update, coll)

	_, err = coll.UpdateByID(context.Background(), filter, update)
	if err != nil {
		return model.Status{Status: "Failed", ErrorString: "Something Wrong"}, err
	}

	return model.Status{Status: "Success", ErrorString: "nil"}, err
}
