ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	permit_params :email, :admin, :first_name, :last_name, :username

	form do |f|
		f.semantic_errors
		f.inputs do
			f.inputs :email
			f.inputs :admin
			f.inputs :username
			f.inputs :first_name
			f.inputs :last_name
		end
		f.actions
	end

	index do
		id_column
		column :first_name
		column :username
		column :email
		column :admin
		actions
	end

end
