ActiveAdmin.register Client do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :last_name
    column :identification
    column :phone
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :last_name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Client Details" do
      f.input :name
      f.input :last_name
      f.input :identification
      f.input :phone
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
