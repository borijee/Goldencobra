ActiveAdmin.register Goldencobra::Permission, :as => "Permission" do
    menu :parent => "Einstellungen", :if => proc{can?(:update, Goldencobra::Permission)}
    controller.authorize_resource :class => Goldencobra::Permission

    index do
      selectable_column
      column "Role", sortable: :role do |permission|
        permission.role.name
      end
      column :action
      column :subject_class
      column :subject_id
      default_actions
    end

    form html: {enctype: "multipart/form-data"} do |f|
      f.actions
      f.inputs do
        f.input :role_id, as: :select, collection: Goldencobra::Role.all.map{|role| [role.name.capitalize, role.id]}, include_blank: false
        f.input :action
        f.input :subject_class
        f.input :subject_id
      end
      f.actions
    end
end
