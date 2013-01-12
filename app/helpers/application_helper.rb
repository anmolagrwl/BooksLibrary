module ApplicationHelper

  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = 'Library'
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def number_to_rubles(number)
    number_to_currency(number, unit: '', precision: 0)
  end
end
