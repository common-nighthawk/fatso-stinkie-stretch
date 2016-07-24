class InventoryShipmentAssignmentsController < ApplicationController
  before_action :find_inventory

  def create
    @assignment = @inventory.create_assignment(inventory_shipment_assignment_params.merge(user: @current_user))
    redirect_to inventories_path
  end

  def update
    @assignment = @inventory.assignment.update_attributes(inventory_shipment_assignment_params.merge(user: @current_user))
    redirect_to inventories_path
  end

  private

  def inventory_shipment_assignment_params
    params.require(:inventory_shipment_assignment).permit(:shipment_id)
  end

  def find_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end
end
