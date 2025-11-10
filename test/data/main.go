package main

// User represents a user in the system
type User struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Email string `json:"email,omitempty"`
}

// UserService handles user operations
type UserService struct {
	users  []User
	apiURL string
}

// NewUserService creates a new user service
func NewUserService(apiURL string) *UserService {
	return &UserService{
		users:  make([]User, 0),
		apiURL: apiURL,
	}
}

// GetUserByID finds a user by ID
func (s *UserService) GetUserByID(id int) *User {
	for _, user := range s.users {
		if user.ID == id {
			return &user
		}
	}
	return nil
}

// AddUser adds a new user
func (s *UserService) AddUser(user User) {
	s.users = append(s.users, user)
}

func main() {
	// Test autocomplete
	service := NewUserService("https://api.example.com")
	service // Should show autocomplete for methods

	// Test struct initialization
	user := User{
		ID:   1,
		Name: "Test User",
	}

	service.AddUser(user)
}
