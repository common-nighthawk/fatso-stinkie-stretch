mattress = Product.create!(name: 'mattress', description: 'Springy latex and high-density memory foams come together to create one perfect sleep surface')
sheets = Product.create!(name: 'sheets', description: 'Impossibly soft, crisp, and airy, our sheets are designed with some of the finest cotton fibers in the world')
pillow = Product.create!(name: 'pillow', description: 'Our responsive, dual-layer pillow is engineered to stay supportive, cool, and comfortable throughout the night — regardless of your sleeping movements')

pheonix = Warehouse.create!(name: 'phoenix', loading_docks: 10)
detroit = Warehouse.create!(name: 'detroit', loading_docks: 8)
store = RetailStore.create!(name: 'nap tour', wheelchair_accessible: true)

Inventory.create!(product: mattress, warehouse: pheonix)
Inventory.create!(product: mattress, warehouse: pheonix)
Inventory.create!(product: mattress, warehouse: detroit)
Inventory.create!(product: sheets, warehouse: pheonix)
Inventory.create!(product: sheets, warehouse: pheonix)
Inventory.create!(product: sheets, warehouse: pheonix)
Inventory.create!(product: sheets, warehouse: detroit)
Inventory.create!(product: pillow, warehouse: detroit)

((Date.today - 30)..(Date.today + 30)).each do |date|
  expected = date
  actual = date unless date.future?
  Shipment.create!(warehouse: pheonix, expected_departure_date: expected, actual_departure_date: actual)
  Shipment.create!(warehouse: detroit, expected_departure_date: expected, actual_departure_date: actual)
end

User.create!(name: 'Alice', email: 'alice@example.com', type: 'FulfillmentSpecialist', location: pheonix)
User.create!(name: 'Bob', email: 'bob@example.com', type: 'FulfillmentSpecialist', location: pheonix)
User.create!(name: 'Carl', email: 'carl@example.com', type: 'FulfillmentSpecialist', location: detroit)
User.create!(name: 'Sally', email: 'sally@example.com', type: 'FulfillmentSpecialist', location: store)

InventoryShipmentAssignment.create(inventory: Inventory.first, shipment: Shipment.first, user: User.first)
InventoryShipmentAssignment.create(inventory: Inventory.second, shipment: Shipment.first, user: User.first)
InventoryShipmentAssignment.create(inventory: Inventory.third, shipment: Shipment.second, user: User.first)
