package service

import (
	"github.com/tesfataf/MenjaApp/api/entity"
	"github.com/tesfataf/MenjaApp/api/request"
)

//UserService repo
type RequestService struct {
	requestRepo request.RequestRepository
}

//NewRequestService will be created
func NewRequestService(reqRepo request.RequestRepository) request.RequestService {
	return &RequestService{requestRepo: reqRepo}
}

//Requests retrueves st
func (reqServ *RequestService) Requests() ([]entity.Request, []error) {
	reqs, errs := reqServ.requestRepo.Requests()
	if len(errs) > 0 {
		return nil, errs
	}

	return reqs, errs

}

// Request retrieves stored comment by its id
func (reqServ *RequestService) Request(id uint) (*entity.Request, []error) {
	req, errs := reqServ.requestRepo.Request(id)
	if len(errs) > 0 {
		return nil, errs
	}
	return req, errs

}

func (reqServ *RequestService) Approve(request *entity.Request) (*entity.Request, []error) {
	app, errs := reqServ.requestRepo.Approve(request)
	if len(errs) > 0 {
		return nil, errs
	}
	return app, errs

}

func (reqServ *RequestService) DisApprove(id uint) (*entity.Request, []error) {
	disapp, errs := reqServ.requestRepo.DisApprove(id)
	if len(errs) > 0 {
		return nil, errs
	}
	return disapp, errs

}
