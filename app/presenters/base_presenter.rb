
class BasePresenter
  require_relative 'base_presenter/icon_link'

  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def self.row_links_to(name)
    define_method(:row_links_target) do
      send(name)
    end
  end

  def h
    @template
  end

  def td(method, styling = {})
    # Makes td have a class named for the attribute shown in it
    styling[:class] = "#{method.to_s} #{styling[:class].to_s}"
    
    content_tag :td, styling do
      concat call_on_self_or_object(method).to_s
    end
  end

  def td_link(method, styling = {})
    # Makes td have a class named for the attribute shown in it
    styling[:class] = "#{method.to_s} #{styling[:class].to_s}"
    
    content_tag :td, styling do
      link_to(
        (call_on_self_or_object(method).to_s or ''), 
        row_links_target
        )
    end
  end

  def icon_bar(*icon_link_types)
    content_tag :nav, class: 'simple-icon-bar' do

      icon_link_types.each do |link_type|
        icon_link(link_type)
      end
    end
  end

  def icon_link(link_type)
    concat IconLink.new(@object, link_type, @template).render
  end

  def display(attribute, options = {}, &block)

    content_tag :p do
      if block_given?
        attribute_label(attribute, options) +
        content_tag(:span, '', {}, &block)
      else
        attribute_label(attribute, options) +
        call_on_self_or_object(attribute).to_s
      end
    end.html_safe
  end



  private
  
  def method_missing(*args, &block)
    if @object.respond_to? args.first
      @object.send(*args, &block)
    else
      @template.send(*args, &block)
    end
  end

  def call_on_self_or_object(method)
    if self.respond_to? method
      self.send(method)
    else
      @object.send(method)
    end
  end

  def attribute_label(attribute, options)
    label_name = options[:label] || labelized_attribute_name(attribute.to_s)
    content_tag :b do 
      "#{label_name}: "
    end
  end

  def labelized_attribute_name(attribute_name)
    capitalized_attribute_name = attribute_name.slice(0,1).capitalize + attribute_name.slice(1..-1)
    capitalized_attribute_name.gsub('_', ' ')
  end
end