module ApplicationHelper
  def btn_classes(key=nil, value=nil)
    additional_class = (value.present? && params[key] == value) ? 'btn-primary' : ''
    base_classes + additional_class
  end

  private

  def base_classes
    'btn btn-default '
  end
end
