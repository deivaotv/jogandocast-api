ActiveAdmin.register Post do
  includes :author

  permit_params :title, :admin_user_id, :image, :content

  index do
    selectable_column
    id_column
    column :image do |post|
      image_tag(url_for(post.image), size: "150x100")
    end
    column :title
    column :content do |post|
      post.content.html_safe
    end
    column :author
    column :created_at
    column :update_at
    actions
  end

  filter :title
  filter :author
  filter :content

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :title
      f.input :author
      f.input :image, as: :file, hint: f.object.try(:image).present? ? image_tag(url_for(f.object.image)) : content_tag(:span, 'no image yet')
      f.input :content, as: :quill_editor
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :author
      row :content do |c|
        c.content.html_safe
      end
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end
end