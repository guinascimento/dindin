module InvoicesHelper
	def total_invoices
		if @invoices.count > 0
			"<span class='positive'>Total: #{number_to_currency Invoice.sum(:value), :unit=> 'R$ ', :separator => ',', :delimiter => '.'}</span>"
		else
			"<span class='positive'>Total: R$ 00,00</span>"
		end
	end

	def payed? invoice
		if invoice.payed?
			"<img src='/images/yes.PNG' width='19px' height='19px' />"
		else
			"<img src='/images/no.PNG' width='19px' height='19px' />"
		end
	end

	def residue salary, debt
		"<span class='positive'>Residue: #{number_to_currency salary - debt, :unit=> 'R$ ', :separator => ',', :delimiter => '.'}</span>"
	end

	def tags invoice
		tags = ""
		invoice.tags.each do |tag|
			if tag.name != nil
				tag.name.split(",").collect(&:strip).each do |t|
					tags += "<span class='tag'>#{t}</span>"
				end
			end
		end
		tags
	end
end