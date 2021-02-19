package request

import "github.com/tesfataf/MenjaApp/api/entity"

//RequestService db opr
type RequestService interface {
	Requests() ([]entity.Request, []error)
	Request(id uint) (*entity.Request, []error)
	Approve(item *entity.Request) (*entity.Request, []error)
	DisApprove(id uint) (*entity.Request, []error)
}
