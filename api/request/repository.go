package request

import "github.com/tesfataf/MenjaApp/api/entity"

//RequestRepository db opr
type RequestRepository interface {
	Requests() ([]entity.Request, []error)
	Request(id uint) (*entity.Request, []error)
	Approve(item *entity.Request) (*entity.Request, []error)
	DisApprove(id uint) (*entity.Request, []error)
	PostRequest(item *entity.Request) (*entity.Request, []error)
}
