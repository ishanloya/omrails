# https://www.youtube.com/watch?v=vp3nrafhjEc

class WardPdf < Prawn::Document
	def initialize(ward)
		super(page_size: "A4")
		@ward = ward
		ward_intro
		ward_admin
		labour_strength
		logo
	end

	def logo

		image Rails.root.join("app/assets/images/crt_logo_gray.png"), width: 200, at: [360, 800]
	end

	def ward_intro
		text "Ward #{@ward.ward_number}", size: 30, style: :bold
		text "#{@ward.ward_name}"
	end

	def ward_admin
		move_down 20
		text "Ward officer: #{@ward.ward_officer}", size: 14, style: :bold
		text "#{@ward.ward_officer_number}"
		text "Ward officer: #{@ward.ward_officer}", size: 14, style: :bold
		text "#{@ward.ward_officer_number}"
		text "Ward officer: #{@ward.ward_officer}", size: 14, style: :bold
		text "#{@ward.ward_officer_number}"
		text "Ward officer: #{@ward.ward_officer}", size: 14, style: :bold
		text "#{@ward.ward_officer_number}"
	end

	def labour_strength
		move_down 20
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
		# t.draw

		
        #   <tr>
        #     <th scope="row">Female</th>
        #     <td><%= @ward.amc_labour_female %></td>
        #     <td><%= @ward.pvt_labour_male %></td>
        #     <td class="totals"><%= @ward.amc_labour_female + @ward.pvt_labour_female %></td>
        #   </tr>
        # </tbody>
        # <tfoot class="totals">
        #   <tr>
        #     <th scope="row">Total</th>
        #     <td><%= @ward.amc_labour_male + @ward.amc_labour_female %></td>
        #     <td><%= @ward.pvt_labour_male + @ward.pvt_labour_female %></td>
        #     <td><%= @ward.amc_labour_male + @ward.amc_labour_female + @ward.pvt_labour_male + @ward.pvt_labour_female %></td>
	end

end