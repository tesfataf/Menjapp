package user

import "github.com/tesfataf/MenjaApp/api/entity"

//UserRepository databaseoperations
type UserRepository interface {
	Users() ([]entity.User, []error)
	User(id uint) (*entity.User, []error)
	UpdateUser(menu *entity.User) (*entity.User, []error)
	DeleteUser(id uint) (*entity.User, []error)
	StoreUser(item *entity.User) (*entity.User, []error)
}
