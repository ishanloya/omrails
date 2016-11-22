# https://www.youtube.com/watch?v=vp3nrafhjEc

class WardPdf < Prawn::Document
	def initialize(ward)
		super(page_size: "A4", bottom_margin: 25)
		@ward = ward
		ward_intro
		# ward_admin
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
		data = [ [0, cursor - 20,"Ward Officer","#{@ward.ward_officer}","#{@ward.ward_officer_number}"],
							[280, cursor - 20, "Sanitary Inspector","#{@ward.inspector}","#{@ward.inspector_number}"],
							[0, cursor - 80, "Corporator","#{@ward.corporator}","#{@ward.corporator_number}"],
							[280, cursor - 80, "Jawan","#{@ward.jawan}","#{@ward.jawan_number}"] ]
		data.each do |x,y,title,name,number|
			bounding_box(["#{x}".to_i, "#{y}".to_i], :width => 250) do
				text "#{title}", size: 16, style: :bold, color: '818a91'
				text "#{name}"
				image Rails.root.join("app/assets/images/call.png"), 
				width: 10, at: [0,"#{cursor}".to_i]
				text_box "#{number}", at: [13,"#{cursor}".to_i] 
			end
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
							["Male", "#{@ward.amc_labour_male}","#{@ward.pvt_labour_male}",
								"#{@ward.amc_labour_male + @ward.pvt_labour_male}"],
							["Female", "#{@ward.amc_labour_female}","#{@ward.pvt_labour_female}",
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
				
				# row(3).font_style = :bold
				row(3).text_color = '818a91'
				column(0).align = :right
				# column(3).font_style = :bold
				column(3).text_color = '818a91'
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
		text_box "<color rgb='818a91'>© #{Date.today.year} Civic Response Team, B-14, MIDC Railway Station, Aurangabad - 431 001, India\n" + 
		"Phone: +91 80074 47750, Email: info@civicresponseteam.com</color>", 
		valign: :bottom, align: :center, size: 8, inline_format: :true
	end

end