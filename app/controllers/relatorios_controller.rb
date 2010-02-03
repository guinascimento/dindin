class RelatoriosController < ApplicationController
  
  def show

  g = Gruff::Pie.new(400)
  g.title = "Scores for Bart" 
  g.font = File.expand_path('artwork/fonts/Vera.ttf', RAILS_ROOT)
  g.labels = { 0 => 'Mon', 2 => 'Wed', 4 => 'Fri', 6 => 'Sun' }

  # Modify this to represent your actual data models
  @data = Invoice.find(:all)
  @data.each do |d|
  # Build data into array with something like
  # built_array = d.collect { |e| e.some_number_field.to_f }
  g.data(d.name, [1, 2, 3])
  end

send_data(g.to_blob, 
       :disposition => 'inline', 
      :type => 'image/png', 
      :filename => "bart_scores.png")

  end
end
