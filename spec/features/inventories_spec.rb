require 'rails_helper'

RSpec.feature "Inventories", type: :feature do
  describe 'index' do
    before do
      warehouse = Warehouse.create!(name: 'chicago')
      user = FulfillmentSpecialist.create!(email: 'daniel@example.com', name: 'daniel', location: warehouse)
      product = Product.create!(name: 'blanket')

      shipment = Shipment.create!(expected_departure_date: '2016-01-01', warehouse: warehouse)
      Shipment.create!(expected_departure_date: '2016-02-01', warehouse: warehouse)
      @assigned_inventory = Inventory.create!(product: product, warehouse: warehouse)
      @unassigned_inventory = Inventory.create!(product: product, warehouse: warehouse)
      InventoryShipmentAssignment.create!(inventory: @assigned_inventory, shipment: shipment, shipper: user)
      visit inventories_url
    end

    context 'view information' do
      it 'displays information about inventory items' do
        expect(page).to have_content('is a blanket')
        expect(page).to have_content('is held at chicago')
        expect(page).to have_content('was assigned by daniel')
      end

      it 'displays expected date inventory will ship' do
        within('.inventory-cards .inventory-card:nth-of-type(1)') do
          selected = find('#inventory_shipment_assignment_shipment_id').text
          expect(selected).to match(/2016-01-01 from chicago/)
        end
      end
    end

    context 'update information' do
      it 'can re-assign inventory to shipment' do
        within('.inventory-cards .inventory-card:nth-of-type(1)') do
          select '2016-02-01', from: 'inventory_shipment_assignment_shipment_id'
          find('input[name="commit"]').click
          expect(@assigned_inventory.shipment.expected_departure_date).to eq(Date.new(2016,2,1))
        end
      end

      it 'can assign inventory to shipment' do
        within('.inventory-cards .inventory-card:nth-of-type(2)') do
          select '2016-01-01', from: 'inventory_shipment_assignment_shipment_id'
          find('input[name="commit"]').click
          expect(@unassigned_inventory.shipment.expected_departure_date).to eq(Date.new(2016,1,1))
        end
      end
    end
  end
end
