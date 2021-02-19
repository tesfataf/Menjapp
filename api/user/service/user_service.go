package service

import (
	"github.com/tesfataf/MenjaApp/api/entity"
	"github.com/tesfataf/MenjaApp/api/user"
)

//UserService repo
type UserService struct {
	userRepo user.UserRepository
}

//NewUserService will be created
func NewUserService(UsrRepo user.UserRepository) user.UserService {
	return &UserService{userRepo: UsrRepo}
}

//Users retrueves st
func (us *UserService) Users() ([]entity.User, []error) {
	usrs, errs := us.userRepo.Users()
	if len(errs) > 0 {
		return nil, errs
	}

	return usrs, errs

}

// User retrieves stored comment by its id
func (us *UserService) User(id uint) (*entity.User, []error) {
	usr, errs := us.userRepo.User(id)
	if len(errs) > 0 {
		return nil, errs
	}
	return usr, errs

}

// UpdateUser updates a given comment
func (us *UserService) UpdateUser(user *entity.User) (*entity.User, []error) {
	usr, errs := us.userRepo.UpdateUser(user)
	if len(errs) > 0 {
		return nil, errs
	}
	return usr, errs
}

// DeleteUser deletes a given comment
func (us *UserService) DeleteUser(id uint) (*entity.User, []error) {
	usr, errs := us.userRepo.DeleteUser(id)
	if len(errs) > 0 {
		return nil, errs
	}
	return usr, errs

}

// StoreUser stores a given comment
func (us *UserService) StoreUser(user *entity.User) (*entity.User, []error) {
	usr, errs := us.userRepo.StoreUser(user)
	if len(errs) > 0 {
		return nil, errs
	}

	return usr, errs
}
