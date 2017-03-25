ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :name, :sure_name, :last_name, :rut, :department, :role, :password
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	index do
		column :email
		column :name
		column :sure_name
		column :last_name
		column :rut
		column :department
		column :role
		actions
	end

	form do |f|
		inputs "Agrega un usuario" do
			input :name
			input :sure_name
			input :last_name
			input :rut
			input :department
			input :role
			input :email
			input :password
		end
		actions
	end

	controller do
		def update
			if (params[:user][:password].blank? && params[:user][:password][:password_confirmation].blank?)
				params[:user].delete("password")
				params[:user].delete("password_confirmation")
			end
		super
		end
	end



end
