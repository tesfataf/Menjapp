package result

import "github.com/tesfataf/MenjaApp/api/entity"

//ResultRepository interface
type ResultRepository interface {
	Result(id uint) (*entity.Result, []error)
	GiveResult(item *entity.Result) (*entity.Result, []error)
}
