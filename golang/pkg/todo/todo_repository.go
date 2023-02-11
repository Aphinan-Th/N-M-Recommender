package todo

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

type ITodoRepository interface {
	GetAllTodo() ([]model.Todo, error)
	InsertTodo(todo model.Todo) (model.Todo, error)
}

type TodoRepository struct {
}

func NewTodoRepository() *TodoRepository {
	return &TodoRepository{}
}

func (repo TodoRepository) getCollection() *mongo.Collection {
	return repo.getDBService().Database.Collection(constant.TodoCollection)
}

func (repo TodoRepository) getDBService() *mongoconnection.DatabaseService {
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

func (repo *TodoRepository) GetAllTodo() ([]model.Todo, error) {
	todos := []model.Todo{}

	query := bson.D{{}}

	cursor, err := repo.getCollection().Find(context.TODO(), query)
	if err != nil {
		return []model.Todo{}, nil
	}

	if err = cursor.All(context.Background(), &todos); err != nil {
		return []model.Todo{}, nil
	}

	return todos, nil
}

func (repo *TodoRepository) InsertTodo(todo model.Todo) (model.Todo, error) {
	result, err := repo.getCollection().InsertOne(context.TODO(), todo)
	if err != nil {
		return model.Todo{}, err
	}

	todo.ID = result.InsertedID.(primitive.ObjectID)
	return todo, err
}
