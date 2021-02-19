package main

import (
	"fmt"
	"net/http"

	"github.com/julienschmidt/httprouter"
	"github.com/tesfataf/MenjaApp/api/delivery/http/handler"

	repositoryReq "github.com/tesfataf/MenjaApp/api/request/repository"
	serviceReq "github.com/tesfataf/MenjaApp/api/request/service"
	repositoryRes "github.com/tesfataf/MenjaApp/api/result/repository"
	serviceRes "github.com/tesfataf/MenjaApp/api/result/service"
	"github.com/tesfataf/MenjaApp/api/user/repository"
	"github.com/tesfataf/MenjaApp/api/user/service"

	"github.com/jinzhu/gorm"
	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 5432
	user     = "postgres"
	password = "password"
	dbname   = "menjappdb"
)

func main() {

	// psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
	// 	"password=%s dbname=%s sslmode=disable",
	// 	host, port, user, password, dbname)

	//db, err := gorm.Open("postgres", psqlInfo)
	db, err := gorm.Open("postgres", "postgres://postgres:password@localhost/menjappdb?sslmode=disable")
	if err != nil {
		panic(err)
	}

	//errs := db.CreateTable(&entity.Result{}).GetErrors()
	// if errs != nil {
	// 	println("its not nil")
	// }
	//defer db.Close()

	//user handler
	userRepo := repository.NewUserGormRepo(db)
	userSrv := service.NewUserService(userRepo)
	adminUserHandler := handler.NewAdminUserHandler(userSrv)

	//Request handler
	requestRepo := repositoryReq.NewRequestGormRepo(db)
	requestSrv := serviceReq.NewRequestService(requestRepo)
	requestHandler := handler.NewRequestHandler(requestSrv)

	//Result handler
	resultRepo := repositoryRes.NewResultGormRepo(db)
	resultSrv := serviceRes.NewResultService(resultRepo)
	resultHandler := handler.NewResultHandler(resultSrv)

	router := httprouter.New()

	//usesrs
	router.GET("/users", adminUserHandler.GetUsers)
	router.GET("/users/:id", adminUserHandler.GetSingleUser)
	router.POST("/users/:id", adminUserHandler.PostUser)
	router.DELETE("/users/:id", adminUserHandler.DeleteUser)
	router.PUT("/users/:id", adminUserHandler.PutUser)

	//requests
	router.GET("/v1/requests", requestHandler.GetRequests)
	router.GET("/v1/requests/:id", requestHandler.GetSingleRequest)
	router.PUT("/v1/requests/:id", requestHandler.Approve)
	router.DELETE("/v1/requests/:id", requestHandler.DisApprove)

	//results
	router.GET("/v1/results/:id", resultHandler.GetResult)
	router.POST("/v1/results/:id", resultHandler.PostResult)

	http.ListenAndServe("192.168.43.42:8181", router)

	//defer db.Close()

	fmt.Println("You connected to your database.")

}
