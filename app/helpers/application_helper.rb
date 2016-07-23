module ApplicationHelper
  def shipment_select_opts(shipments)
    shipments.map { |s| [s.description, s.id] }
  end

  def btn_classes(key=nil, value=nil)
    additional_class = (value.present? && params[key] == value) ? 'btn-primary' : ''
    base_classes + additional_class
  end

  private

  def base_classes
    'btn btn-default '
  end
end
