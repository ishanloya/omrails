# https://www.youtube.com/watch?v=vp3nrafhjEc

class WardPdf < Prawn::Document
	def initialize(ward)
		super(page_size: "A4")
		@ward = ward
		ward_intro
		ward_admin
		labour_strength
		logo
		footer
	end

	def logo

		image Rails.root.join("app/assets/images/crt_logo_gray.png"), width: 200, at: [360, 800]
	end

	def ward_intro
		text "<font size='30'><color rgb='000000'><b>Ward #{@ward.ward_number}</b></color></font>  Zone #{@ward.zone}",
		size: 20, color: '818a91', :inline_format => true  

		text "#{@ward.ward_name}"
	end

	def ward_admin
		move_down 20
		text_box "Ward officer", size: 16, style: :bold, color: '818a91', at: [0, 680]
		text_box "#{@ward.ward_officer}\nPh: #{@ward.ward_officer_number}", at: [0, 660]
		
		text_box "Sanitary Inspector", size: 16, style: :bold, color: '818a91', at: [250, 680]
		text_box "#{@ward.inspector}\nPh: #{@ward.inspector_number}", at: [250, 660]
		
		text_box "Corporator", size: 16, style: :bold, color: '818a91', at: [0, 580+30]
		text_box "#{@ward.corporator}\nPh: #{@ward.corporator_number}", at: [0, 560+30]
		
		text_box "Jawan", size: 16, style: :bold, color: '818a91', at: [250, 580+30]
		text_box "#{@ward.jawan}\nPh: #{@ward.jawan_number}", at: [250, 560+30]
		



		# move_down 10

		# text "Ward officer", size: 16, style: :bold, color: '818a91'
		# text "#{@ward.ward_officer} #{@ward.ward_officer_number}"
		# move_down 10

		# text "Ward officer", size: 16, style: :bold, color: '818a91'
		# text "#{@ward.ward_officer} #{@ward.ward_officer_number}"
		# move_down 10

		# text "Ward officer", size: 16, style: :bold, color: '818a91'
		# text "#{@ward.ward_officer} #{@ward.ward_officer_number}"
		# move_down 10
	end


	# def	bounding_box([0, cursor-50], :width => 200, :height => 150)
	#  transparent(0.5) { stroke_bounds }
	#  text "This text will flow along this bounding box we created for it. " * 5
	# end

	# def bounding_box([300, y_position], :width => 200, :height => 150)
	#  transparent(0.5) { stroke_bounds } # This will stroke on one page
	#  text "Now look what happens when the free flowing text reaches the end " +
	#  "of a bounding box that is narrower than the margin box." +
	#  " . " * 200 +
	#  "It continues on the next page as if the previous bounding box " +
	#  "was cloned. If we want it to have the same border as the one on " +
	#  "the previous page we will need to stroke the boundaries again."
	#  transparent(0.5) { stroke_bounds } # And this will stroke on the next
	# end

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
		canvas do
			text_box "B-14, MIDC Railway Station, Aurangabad - 431 001, INDIA, " + 
			"Phone: +91 80074 47750, Email: info@civicresponseteam.com", 
			:at => [65, 30], size: 8
		end
	end

end