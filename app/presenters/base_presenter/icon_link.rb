
class IconLink

  def initialize(resource, type, template)
    @resource = resource
    @type = type
    @template = template
  end

  def render
    send(@type)
  end



  private
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end


  # ICON BUILDING METHODS

  def link_path
    if @type == 'index'
      send "#{resource_name}s_path"
    else
      send "#{@type}_#{resource_name}_path" 
    end
  end

  def link_label_text
    @type.to_s.titleize
    # if @type == 'index'
    #   "#{resource_name.titleize} Index"
    # else
    #   "#{@type.to_s.titleize} #{resource_name.titleize}" 
    # end
  end

  def resource_name
    @resource.class.name.downcase
  end

  def labeled_icon(link_name, icon_class, link_path, link_options = {})
    link_options.merge!({class: 'item'})

    link_to link_path, link_options do
      concat fontawesome_icon(icon_class)
      concat content_tag :label, link_name
    end
  end

  def fontawesome_icon(icon_class)
    content_tag :i, '', class: "fa #{icon_class}"
  end

  
  # STANDARD ICONS

  def index

    labeled_icon(
      link_label_text, 
      'fa-list', 
      link_path
      )
  end

  def new

    labeled_icon(
      link_label_text, 
      'fa-plus', 
      link_path
      )
  end

  def edit

    labeled_icon(
      link_label_text, 
      'fa-edit',
      link_path
      )
  end

  def delete
    labeled_icon(
      link_label_text, 
      'fa-trash-o', 
      @resource, 
      method: :delete, 
      data: { confirm: 'Are you sure?' }
      )
  end

  # resource object not used in this one, but
  # keeping the arg keeps signatures uniform
  def back
    labeled_icon("Back", 'fa-arrow-circle-o-left', :back)
  end
end
