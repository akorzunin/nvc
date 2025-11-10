// TypeScript LSP Test File
interface User {
  id: number;
  name: string;
  email?: string;
}

class UserService {
  private users: User[] = [];

  constructor(private apiUrl: string) {}

  async getUserById(id: number): Promise<User | undefined> {
    // Test autocomplete for array methods
    return this.users.find(user => user.id === id);
  }

  addUser(user: User): void {
    this.users.push(user);
  }
}

function Name(params: User): string {
  return params.name;
}

const n = (params: User): string => {
  return params.name;
};

// Test type checking and autocomplete
const service = new UserService("https://api.example.com");
service. // Should show autocomplete for methods

// Test interface implementation
const testUser: User = {
  id: 1,
  name: "Test User",
  // email is optional
};
