# https://www.youtube.com/watch?v=vp3nrafhjEc

class WardPdf < Prawn::Document
	def initialize(ward)
		super(page_size: "A4")
		@ward = ward
		ward_number
		ward_admin
	end

	def ward_number
		text "Ward #{@ward.ward_number}", size: 30, style: :bold
		text "#{@ward.ward_name}"
	end

	def ward_admin
		move_down 20
		text "Ward officer: #{@ward.ward_officer}", size: 14, style: :bold
		text "#{@ward.ward_officer_number}"
	end

end