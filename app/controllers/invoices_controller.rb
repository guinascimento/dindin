class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.find(:all, :conditions => { :month => params[:month].to_i }).order_by([:expiration_date, :asc])
    @user = User.last
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  def new
    @invoice = Invoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice }
    end
  end


  def edit
    @invoice = Invoice.find(params[:id], :conditions => { :month => params[:month].to_i })
  end

  def create
    @invoice = Invoice.new(params[:invoice])
		@invoice.month = params[:month]

		puts params[:tags]

		tags = params[:tags]
		if tags != nil
			tags.each do |tag|
				tag.split(",").collect(&:strip).each do |name|
					@invoice.tags << [ Tag.new(:name => name) ]
				end
			end
		end

    respond_to do |format|
      if @invoice.save
        flash[:notice] = 'Invoice was successfully created.'
        format.html { redirect_to "/#{params[:month]}/invoices/list" }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
		puts "atualizandooooooooo"

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        flash[:notice] = 'Invoice was successfully updated.'
      format.html { redirect_to "/#{params[:month]}/invoices/list" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
		puts "deletandoooooooooooooooooooooooo"
    respond_to do |format|
      format.html { redirect_to "/#{params[:month]}/invoices/list" }
      format.xml  { head :ok }
    end
  end

	def paid
    @invoice = Invoice.find(params[:id])
		@invoice.update_attributes(:payed => :true)
	end

	def unpaid
    @invoice = Invoice.find(params[:id])
		@invoice.update_attributes(:payed => :false)
	end
end
