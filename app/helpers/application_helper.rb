module ApplicationHelper
  def link_to_add_fields name, f, association
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for association, new_object, child_index: id do |builder|
      render association.to_s.singularize + "_fields", f: builder
    end
    link_to name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")}
  end

  def activities
    user = photographer_signed_in? ? current_photographer : current_customer
    @activities = PublicActivity::Activity.where(recipient: user).order("created_at desc")
  end
end
