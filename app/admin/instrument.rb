ActiveAdmin.register Instrument do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs "Instrument Details" do
      f.input :name
    end
    f.actions
  end
end