-- Lua LSP Test File

---@class User
---@field id number
---@field name string
---@field email string|nil
local User = {}
User.__index = User

---@param id number
---@param name string
---@param email string|nil
---@return User
function User.new(id, name, email)
    local self = setmetatable({}, User)
    self.id = id
    self.name = name
    self.email = email
    return self
end

---@class UserService
---@field private users User[]
---@field private api_url string
local UserService = {}
UserService.__index = UserService

---@param api_url string
---@return UserService
function UserService.new(api_url)
    local self = setmetatable({}, UserService)
    self.api_url = api_url
    self.users = {}
    return self
end

---@param id number
---@return User|nil
function UserService:get_user_by_id(id)
    for _, user in ipairs(self.users) do
        if user.id == id then
            return user
        end
    end
    return nil
end

---@param user User
function UserService:add_user(user)
    table.insert(self.users, user)
end

-- Test autocomplete
local service = UserService.new("https://api.example.com")
service: -- Should show autocomplete for methods

-- Test type annotations
local user = User.new(1, "Test User")
service:add_user(user)
