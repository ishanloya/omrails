module ApplicationHelper
	def nav_link(link_text, link_path)
		class_name = current_page?(link_path) ? 'nav-item active' : 'nav-item'

		content_tag(:li, :class => class_name) do
			link_to link_text, link_path, class: "nav-link"
		end
	end
end
