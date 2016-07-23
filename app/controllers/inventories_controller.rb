class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.send(sanitized_scope)
    @inventories = @inventories.where(warehouse: sanitized_warehouse) if params['warehouse']
  end

  private

  def sanitized_scope
    if params['shipped']
      :shipped
    elsif params['not_shipped']
      :not_shipped
    else
      :all
    end
  end

  def sanitized_warehouse
    name = params['warehouse'].downcase
    Warehouse.find_by(name: name)
  end
end
