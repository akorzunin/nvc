# Python LSP Test File


class User:
    def __init__(self, id: int, name: str, email: str | None = None):
        self.id = id
        self.name = name
        self.email = email

    def to_dict(self) -> dict:
        return {"id": self.id, "name": self.name, "email": self.email}


class UserService:
    def __init__(self, api_url: str):
        self.api_url = api_url
        self.users: list[User] = []

    def get_user_by_id(self, user_id: int) -> User | None:
        # Test autocomplete for list methods
        return next((user for user in self.users if user.id == user_id), None)

    def add_user(self, user: User) -> None:
        self.users.append(user)

    def get_all_users(self) -> list[dict]:
        return [user.to_dict() for user in self.users]


def name(user: User) -> str:
    return user.name


# Test autocomplete and type checking
service = UserService("https://api.example.com")
service  # Should show autocomplete for methods

# Test type hints
test_user = User(1, "Test User")
