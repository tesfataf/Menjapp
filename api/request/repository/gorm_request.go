package repository

import (
	"github.com/jinzhu/gorm"
	"github.com/tesfataf/MenjaApp/api/entity"
	"github.com/tesfataf/MenjaApp/api/request"
)

//UserGormRepo db
type RequestGormRepo struct {
	conn *gorm.DB
}

//NewUserGormRepo new conn
func NewRequestGormRepo(db *gorm.DB) request.RequestRepository {
	return &RequestGormRepo{conn: db}
}

//Testers fetch service
func (reqRepo *RequestGormRepo) Requests() ([]entity.Request, []error) {
	reqs := []entity.Request{}
	errs := reqRepo.conn.Find(&reqs).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}

	return reqs, errs

}

//User retrieves a customer comment from the database by its id
func (reqRepo *RequestGormRepo) Request(id uint) (*entity.Request, []error) {
	req := entity.Request{}
	errs := reqRepo.conn.First(&req, id).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}
	return &req, errs

}

//Approve method
func (reqRepo *RequestGormRepo) Approve(request *entity.Request) (*entity.Request, []error) {
	req := request
	errs := reqRepo.conn.Save(request).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}
	return req, errs
}

func (reqRepo *RequestGormRepo) DisApprove(id uint) (*entity.Request, []error) {

	req, errs := reqRepo.Request(id)

	if len(errs) > 0 {
		return nil, errs
	}

	errs = reqRepo.conn.Delete(req, id).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}
	return req, errs
}

//PostRequest stores a given customer comment in the database
func (reqRepo *RequestGormRepo) PostRequest(request *entity.Request) (*entity.Request, []error) {
	req := request
	errs := reqRepo.conn.Create(req).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}

	return req, errs

}
