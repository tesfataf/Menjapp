package entity

import (
	"time"
)

// User represents user data
type User struct {
	ID         uint   `json:"id"`
	FirstName  string `json:"firstname" gorm:"varchar(255);not null"`
	LastName   string `json:"lastname" gorm:"varchar(255);not null"`
	UserName   string `json:"username" gorm:"type:varchar(255);not null"`
	Password   string `json:"password" gorm:"varchar(255);not null"`
	ProfilePic string `json:"profilepic" gorm:"varchar(255);"`
	Role       string `json:"role" gorm:"varchar(255);not null"`
}

//Request sent by students
type Request struct {
	ID          uint      `json:"id"`
	StudentID   uint      `json:"studentid"`
	PlateNumber uint      `json:"platenumber"`
	Date        time.Time `json:"date" sql:"DEFAULT:current_timestamp"`
}

//Result of students
type Result struct {
	ID        uint `json:"id"`
	StudentID uint `json:"studentid"`
	Test1     uint `json:"test1"`
	Test2     uint `json:"test2"`
	Test3     uint `json:"test3"`
	Test4     uint `json:"test4"`
}
