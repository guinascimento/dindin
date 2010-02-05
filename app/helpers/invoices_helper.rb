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
			"<img alt='Yes' src='/images/yes.png' width='19px' height='19px' />"
		else
			"<img alt='Yes' src='/images/no.png' width='19px' height='19px' />"
		end
	end

	def residue salary, debt
		if debt != 0.0
			"<span class='positive'>Residue: #{number_to_currency salary - debt, :unit=> 'R$ ', :separator => 			',', :delimiter => '.'}</span>"
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
