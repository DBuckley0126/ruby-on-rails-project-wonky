module ApplicationHelper

  # Returns first error Message for input
  def display_first_error(model, attr)
    model.errors.full_messages_for(attr).first if model.errors.has_key?(attr)
  end

end
