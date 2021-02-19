package repository

import (
	"github.com/jinzhu/gorm"
	"github.com/tesfataf/MenjaApp/api/entity"
	"github.com/tesfataf/MenjaApp/api/result"
)

//UserGormRepo db
type ResultGormRepo struct {
	conn *gorm.DB
}

//NewUserGormRepo new conn
func NewResultGormRepo(db *gorm.DB) result.ResultRepository {
	return &ResultGormRepo{conn: db}
}

//Result retrieves a customer comment from the database by its id
func (resRepo *ResultGormRepo) Result(id uint) (*entity.Result, []error) {
	res := entity.Result{}
	errs := resRepo.conn.First(&res, id).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}
	return &res, errs

}

//GiveResult stores a given customer comment in the database
func (resRepo *ResultGormRepo) GiveResult(result *entity.Result) (*entity.Result, []error) {
	res := result
	errs := resRepo.conn.Create(res).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}

	return res, errs

}
