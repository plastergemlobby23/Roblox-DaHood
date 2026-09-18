local Product = {}
Product.__index = Product

function Product.new(name, price, quantity)
    local self = setmetatable({}, Product)
    self.name = name
    self.price = price
    self.quantity = quantity
    return self
end

function Product:getValue()
    return self.price * self.quantity
end

local Inventory = {}
Inventory.__index = Inventory

function Inventory.new()
    local self = setmetatable({}, Inventory)
    self.products = {}
    return self
end

function Inventory:addProduct(name, price, quantity)
    table.insert(self.products, Product.new(name, price, quantity))
end

function Inventory:getTotalValue()
    local total = 0

    for _, product in ipairs(self.products) do
        total = total + product:getValue()
    end

    return total
end

function Inventory:sortProducts()
    table.sort(self.products, function(a, b)
        return a:getValue() > b:getValue()
    end)
end

function Inventory:printReport()
    print("Inventory Report")
    print("================")

    for _, product in ipairs(self.products) do
        print(string.format(
            "%-15s | $%.2f | %d units | $%.2f",
            product.name,
            product.price,
            product.quantity,
            product:getValue()
        ))
    end

    print("================")
    print(string.format("Total Value: $%.2f", self:getTotalValue()))
end

local inventory = Inventory.new()

inventory:addProduct("Laptop", 899.99, 5)
inventory:addProduct("Keyboard", 79.50, 12)
inventory:addProduct("Mouse", 39.99, 20)
inventory:addProduct("Monitor", 249.99, 8)

inventory:sortProducts()
inventory:printReport()