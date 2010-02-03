class ReportController < ApplicationController
  def index
  end

  def pizza
    g = Gruff::Pie.new(500)
    g.title = "Gastos Mensais"

    @data = Invoice.find(:all)
    @data.each do |d|
      g.data(d.name, d.value)
    end

    send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "bart_scores.png")
  end
end