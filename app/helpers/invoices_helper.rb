module InvoicesHelper
	def total_invoices
		if @invoices.count > 0
			"<span class='positive'>Total: #{number_to_currency Invoice.sum(:value), :unit=> 'R$ ', :separator => ',', :delimiter => '.'}</span>"
		else
			"<span class='positive'>Total: R$ 00,00</span>"
		end
	end

	def paid? invoice
		if invoice.paid?
			"#{link_to_function image_tag("yes.png", :border => 0, :width => "19px", :height => "19px", :id => "#{invoice.id}"), "unpaid('#{invoice.id}')"}"
		else
			"#{link_to_function image_tag("no.png", :border => 0, :width => "19px", :height => "19px", :id => "#{invoice.id}"), "paid('#{invoice.id}')"}"
		end
	end

	def residue salary, debt
		if debt != 0.0
			if salary < debt
				"<span class='negative'>#{number_to_currency salary - debt, :unit=> 'R$ ', :separator => 			',', :delimiter => '.'}</span>"
			else
				"<span class='positive'>#{number_to_currency salary - debt, :unit=> 'R$ ', :separator => 			',', :delimiter => '.'}</span>"
			end
		end
	end

	def tags invoice
		tags = ""
		invoice.tags.each do |tag|
			if tag.name != nil
					tags += "<span class='tag'>#{tag.name}</span>"
			end
		end
		tags
	end
end
