module ApplicationHelper
	include Twitter::Autolink
	def nav_link(link_text, link_path)
		class_name = current_page?(link_path) ? 'nav-item active' : 'nav-item'

		content_tag(:li, :class => class_name) do
			link_to link_text, link_path, class: "nav-link"
		end
	end

	def nav_link_right(link_text, link_path)
		class_name = current_page?(link_path) ? 'nav-item active pull-xs-right' : 'nav-item pull-xs-right'

		content_tag(:li, :class => class_name) do
			link_to link_text, link_path, class: "nav-link"
		end
	end
end
