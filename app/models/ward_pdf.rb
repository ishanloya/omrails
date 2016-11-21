# https://www.youtube.com/watch?v=vp3nrafhjEc

class WardPdf < Prawn::Document
	def initialize(ward)
		super(page_size: "A4", bottom_margin: 20)
		@ward = ward
		ward_intro
		ward_admin
		waste
		labour_strength
		logo
		footer	
		# stroke_axis(at: [300,0])
	end

	def logo
		image Rails.root.join("app/assets/images/crt_crop_gray.png"), 
		width: 100, vposition: :top, position: :right
	end

	def ward_intro
		text "<font size='30'><color rgb='000000'>" +
		"<b>Ward #{@ward.ward_number}</b></color></font>  Zone #{@ward.zone}",
		size: 20, color: '818a91', inline_format: :true  
		text "#{@ward.ward_name} | #{@ward.households} households", size: 14, inline_format: :true
	end

	def ward_admin
		y_position = cursor - 20
		bounding_box([0, y_position], :width => 200) do
			text "Ward officer", size: 16, style: :bold, color: '818a91'
			text "#{@ward.ward_officer}"
			image Rails.root.join("app/assets/images/call.png"), 
			width: 10, at: [0,"#{cursor}".to_i]
			text_box "#{@ward.ward_officer_number}", at: [13,"#{cursor}".to_i] 
		end
		bounding_box([280, y_position], :width => 200) do
			text "Sanitary Inspector", size: 16, style: :bold, color: '818a91'
			text "#{@ward.inspector}"
			image Rails.root.join("app/assets/images/call.png"), 
			width: 10, at: [0,"#{cursor}".to_i]
			text_box "#{@ward.inspector_number}", at: [13,"#{cursor}".to_i]
		end
		y_position = cursor - 25
		bounding_box([0, y_position], :width => 200) do
			text "Corporator", size: 16, style: :bold, color: '818a91'
			text "#{@ward.corporator}"
			image Rails.root.join("app/assets/images/call.png"), 
			width: 10, at: [0,"#{cursor}".to_i]	
			text_box "#{@ward.corporator_number}", at: [13,"#{cursor}".to_i]
		end
		bounding_box([280, y_position], :width => 200) do
			text "Jawan", size: 16, style: :bold, color: '818a91'
			text "#{@ward.jawan}"
			image Rails.root.join("app/assets/images/call.png"), 
			width: 10, at: [0,"#{cursor}".to_i]
			text_box "#{@ward.jawan_number}", at: [13,"#{cursor}".to_i]
		end
	end

	def waste
		y_position = cursor - 40
		bounding_box([0, y_position], :width => 240) do

			text "Quantity of Waste (kg)", size: 16, style: :bold, color: '818a91'
			data = [	["Organic","Recyclable","Hazardous"],
			["#{@ward.waste_org_qty.to_i}","#{@ward.waste_dry_qty.to_i}","#{@ward.waste_haz_qty.to_i}"] ]

			table(data) do
					cells.padding = 10
					cells.borders = []
					cells.border_color = 'eceeef'
					cells.align = :center
					row(0).borders = [:bottom]
					row(0).valign = :bottom
					# row(0).font_style = :bold
					columns(0..1).borders = [:right]
					row(0).columns(0..1).borders = [:bottom, :right]
				end
		end

		bounding_box([280, y_position], :width => 240) do
			text "List of Establishments", size: 16, style: :bold, color: '818a91'
			data = [ ["Commercial","Educational","Medical"],
					["#{@ward.comm_est}","#{@ward.edu_est}","#{@ward.med_est}"] 
				]

			table(data) do
				cells.padding = 10
				cells.borders = []
				cells.border_color = 'eceeef'
				cells.align = :center
				row(0).borders = [:bottom]
				row(0).valign = :bottom
				# row(0).font_style = :bold
				columns(0..1).borders = [:right]
				row(0).columns(0..1).borders = [:bottom, :right]
			end
	   #           @ward.waste_org 
	   #          @ward.waste_dry 
	  end                 
	end

	def labour_strength
		y_position = cursor - 30
		bounding_box([0, y_position], :width => 300) do
			text "Labour Strength", size: 16, style: :bold, color: '818a91'
			data = [ ["","AMC","Private","Total"],
							[{image: Rails.root.join("app/assets/images/gentleman.png"),
								image_width: 25, position: :center, vposition: :center},
								"#{@ward.amc_labour_male}","#{@ward.pvt_labour_male}",
								"#{@ward.amc_labour_male + @ward.pvt_labour_male}"],
							[{image: Rails.root.join("app/assets/images/girl.png"),
								image_width: 25, position: :center, vposition: :center},
								"#{@ward.amc_labour_female}","#{@ward.pvt_labour_female}",
							"#{@ward.amc_labour_female + @ward.pvt_labour_female}"],
							["Total","#{@ward.amc_labour_male + @ward.amc_labour_female}",
								"#{@ward.pvt_labour_male + @ward.pvt_labour_female}",
							"#{@ward.amc_labour_female + @ward.pvt_labour_female +
							@ward.amc_labour_male + @ward.pvt_labour_male}"] ]
			table(data) do
				cells.padding = 10
				cells.borders = []
				cells.border_color = 'eceeef'
				cells.align = :center
				
				row(3).font_style = :bold
				column(3).font_style = :bold
				row(0).valign = :bottom
				# row(0).font_style = :bold
				columns([0,2]).borders = [:right]
				row(0).borders = [:bottom]
				row(2).borders = [:bottom]
				row(0).columns([0,2]).borders = [:bottom, :right]
				row(2).columns([0,2]).borders = [:bottom, :right]
			end
		end
	end

	

	def footer
		text_box "<b>© #{Date.today.year} Civic Response Team</b>\n<color rgb='818a91'>B-14, MIDC Railway Station, Aurangabad - 431 001, India, " + 
		"Phone: +91 80074 47750, Email: info@civicresponseteam.com</color>", 
		valign: :bottom, align: :center, size: 8, inline_format: :true
	end

end