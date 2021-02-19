package service

import (
	"github.com/tesfataf/MenjaApp/api/entity"
	"github.com/tesfataf/MenjaApp/api/result"
)

//ResultService repo
type ResultService struct {
	resultRepo result.ResultRepository
}

//NewResultService will be created
func NewResultService(resRepo result.ResultRepository) result.ResultService {
	return &ResultService{resultRepo: resRepo}
}

//Result retrieves stored comment by its id
func (resServ *ResultService) Result(id uint) (*entity.Result, []error) {
	res, errs := resServ.resultRepo.Result(id)
	if len(errs) > 0 {
		return nil, errs
	}
	return res, errs

}

//GiveResult service
func (resServ *ResultService) GiveResult(result *entity.Result) (*entity.Result, []error) {
	res, errs := resServ.resultRepo.GiveResult(result)
	if len(errs) > 0 {
		return nil, errs
	}
	return res, errs

}
