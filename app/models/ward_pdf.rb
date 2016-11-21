# https://www.youtube.com/watch?v=vp3nrafhjEc

class WardPdf < Prawn::Document
	def initialize(ward)
		super(page_size: "A4")
		@ward = ward
		ward_intro
		ward_admin
		labour_strength
		logo
		boxy
		footer
	end

	
	# stroke_axis
	# stroke_circle [0, 0], 10
	def boxy
		# stroke_axis
		# stroke_circle [0, 0], 10
		bounding_box([100, 300], :width => 300, :height => 200) do
		 stroke_bounds
		 stroke_circle [0, 0], 10
		end
	end

	def logo

		image Rails.root.join("app/assets/images/crt_logo_gray.png"), width: 200, at: [360, 800]
	end

	def ward_intro
		text "<font size='30'><color rgb='000000'><b>Ward #{@ward.ward_number}</b></color></font>  Zone #{@ward.zone}",
		size: 20, color: '818a91', inline_format: :true  

		text "#{@ward.ward_name}"
	end

	def ward_admin
		text_box "Ward officer", size: 16, style: :bold, color: '818a91', at: [0, 680]
		text_box "#{@ward.ward_officer}\nPh: #{@ward.ward_officer_number}", at: [0, 660]
		
		text_box "Sanitary Inspector", size: 16, style: :bold, color: '818a91', at: [250, 680]
		text_box "#{@ward.inspector}\nPh: #{@ward.inspector_number}", at: [250, 660]
		
		text_box "Corporator", size: 16, style: :bold, color: '818a91', at: [0, 580+30]
		text_box "#{@ward.corporator}\nPh: #{@ward.corporator_number}", at: [0, 560+30]
		
		text_box "Jawan", size: 16, style: :bold, color: '818a91', at: [250, 580+30]
		text_box "#{@ward.jawan}\nPh: #{@ward.jawan_number}", at: [250, 560+30]
		
	end

	def labour_strength
		move_down 180
		text "Labour Strength", size: 14, style: :bold
		table ([ ["","AMC Labour","Private Labour","Total"],
						["Male","#{@ward.amc_labour_male}","#{@ward.pvt_labour_male}",
							"#{@ward.amc_labour_male + @ward.pvt_labour_male}"],
						["Female","#{@ward.amc_labour_female}","#{@ward.pvt_labour_female}",
						"#{@ward.amc_labour_female + @ward.pvt_labour_female}"],
						["Total","#{@ward.amc_labour_male + @ward.amc_labour_female}",
							"#{@ward.pvt_labour_male + @ward.pvt_labour_female}",
						"#{@ward.amc_labour_female + @ward.pvt_labour_female +
						@ward.amc_labour_male + @ward.pvt_labour_male}"] ])
	end

	def footer
		text_box "<b>© #{Date.today.year} Civic Response Team</b>\n<color rgb='818a91'>B-14, MIDC Railway Station, Aurangabad - 431 001, India, " + 
		"Phone: +91 80074 47750, Email: info@civicresponseteam.com</color>", 
		valign: :bottom, align: :center, size: 8, inline_format: :true
	end

end