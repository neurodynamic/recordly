module ApplicationHelper
  
  def app_name
    Rails.application.config.session_options[:key].sub(/^_/,'').sub(/_session/,'')
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def active_if_on_page(controller, action)
    'active' if on_page(controller, action)
  end
  
  def on_page(controller = params[:controller], action)
    params[:controller] == controller.to_s and 
        params[:action] == action.to_s
  end
  
  # def link_to_add_fields(name, f, association)
  #   new_object = f.object.send(association).klass.new
  #   id = new_object.object_id
  #   fields = f.fields_for(association, new_object, child_index: id) do |builder|
  #     render(association.to_s.singularize + "_fields", f: builder)
  #   end
  #   link_to(name, '#', class: "add_fields button small round", data: {id: id, fields: fields.gsub("\n", "")})
  # end
end
