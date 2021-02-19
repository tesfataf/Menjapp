package repository

import (
	"github.com/jinzhu/gorm"
	"github.com/tesfataf/MenjaApp/api/entity"
	"github.com/tesfataf/MenjaApp/api/user"
)

//UserGormRepo db
type UserGormRepo struct {
	conn *gorm.DB
}

//NewUserGormRepo new conn
func NewUserGormRepo(db *gorm.DB) user.UserRepository {
	return &UserGormRepo{conn: db}
}

// // Users returns all users from the database
// func (ur *UserGormRepo) Users(role string) ([]entity.User, []error) {
// 	users := []entity.User{}
// 	errs := ur.conn.Where("role = ?", role).Find(&users).GetErrors()

// 	if len(errs) > 0 {
// 		return nil, errs
// 	}

// 	return users, nil
// }

// // User returns a single users from the database with user name and password
// func (ur *UserGormRepo) User(user *entity.User) (*entity.User, []error) {
// 	lgusr := user
// 	usr := entity.User{}
// 	errs := ur.conn.Where("email = ?", user.Email).First(&usr).GetErrors()
// 	err := bcrypt.CompareHashAndPassword([]byte(usr.Password), []byte(lgusr.Password))
// 	fmt.Println(err)
// 	if err != nil {
// 		return nil, []error{err}
// 	}

// 	if len(errs) > 0 {
// 		return nil, errs
// 	}

// 	return &usr, nil
// }

// // UserByID returns a single user by its id from the database
// func (ur *UserGormRepo) UserByID(id uint) (*entity.User, []error) {
// 	usr := entity.User{}
// 	errs := ur.conn.First(&usr, id).GetErrors()
// 	if len(errs) > 0 {
// 		return nil, errs
// 	}

// 	return &usr, nil
// }

// // UpdateUser updates user from the database
// func (ur *UserGormRepo) UpdateUser(user *entity.User) (*entity.User, []error) {
// 	usr := user
// 	data := entity.User{}
// 	usr.Password, _ = handler.HashPassword(user.Password)
// 	errs := ur.conn.Model(&data).Updates(usr).Error
// 	if errs != nil {
// 		return nil, []error{errs}
// 	}
// 	return usr, nil
// }

// // DeleteUser deletes a single user from the database by it's id
// func (ur *UserGormRepo) DeleteUser(id uint) (*entity.User, []error) {
// 	usr, errs := ur.UserByID(id)

// 	if len(errs) > 0 {
// 		return nil, errs
// 	}

// 	errs = ur.conn.Delete(usr, id).GetErrors()

// 	if len(errs) > 0 {
// 		return nil, errs
// 	}

// 	return usr, nil
// }

// // StoreUser will insert a new user to the database
// func (ur *UserGormRepo) StoreUser(user *entity.User) (*entity.User, []error) {
// 	usr := user
// 	usr.Password, _ = handler.HashPassword(user.Password)
// 	errs := ur.conn.Create(usr).GetErrors()

// 	for _, err := range errs {
// 		pqerr := err.(*pq.Error)
// 		fmt.Println(pqerr)
// 	}
// 	if len(errs) > 0 {
// 		return nil, errs
// 	}

// 	return usr, nil
// }

//Users fetch service
func (usrRepo *UserGormRepo) Users() ([]entity.User, []error) {
	usrs := []entity.User{}
	errs := usrRepo.conn.Find(&usrs).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}

	return usrs, errs

}

//User retrieves a customer comment from the database by its id
func (usrRepo *UserGormRepo) User(id uint) (*entity.User, []error) {
	usr := entity.User{}
	errs := usrRepo.conn.First(&usr, id).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}
	return &usr, errs

}

// UpdateUser updates a given customer comment in the database
func (usrRepo *UserGormRepo) UpdateUser(user *entity.User) (*entity.User, []error) {
	usr := user
	errs := usrRepo.conn.Save(usr).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}
	return usr, errs

}

// DeleteUser deletes a given customer comment from the database
func (usrRepo *UserGormRepo) DeleteUser(id uint) (*entity.User, []error) {
	usr, errs := usrRepo.User(id)

	if len(errs) > 0 {
		return nil, errs
	}

	errs = usrRepo.conn.Delete(usr, id).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}
	return usr, errs
}

// StoreUser stores a given customer comment in the database
func (usrRepo *UserGormRepo) StoreUser(user *entity.User) (*entity.User, []error) {
	usr := user
	errs := usrRepo.conn.Create(usr).GetErrors()
	if len(errs) > 0 {
		return nil, errs
	}

	return usr, errs

}
