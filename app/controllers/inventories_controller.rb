class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.send(sanitized_scope)
    @inventories = @inventories.where(warehouse: sanitized_warehouse) if params[:warehouse]
  end

  private

  def sanitized_scope
    shipped_param = params[:shipped].to_s.downcase
    %w(shipped not_shipped).include?(shipped_param) ? shipped_param : :all
  end

  def sanitized_warehouse
    name = params[:warehouse].downcase
    Warehouse.find_by(name: name)
  end
end
