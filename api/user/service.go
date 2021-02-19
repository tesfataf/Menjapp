package user

import "github.com/tesfataf/MenjaApp/api/entity"

//UserService databaseoperations
type UserService interface {
	Users() ([]entity.User, []error)
	User(id uint) (*entity.User, []error)
	UpdateUser(user *entity.User) (*entity.User, []error)
	DeleteUser(id uint) (*entity.User, []error)
	StoreUser(item *entity.User) (*entity.User, []error)
}
