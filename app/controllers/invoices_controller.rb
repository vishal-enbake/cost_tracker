class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  before_filter :set_invoice, only: [:show, :edit, :update, :destroy]
  before_filter :set_division, only: [:index, :new, :create, :show, :edit, :update]
  
  def index
    @invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = @division.invoices.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = @division.invoices.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to [@division, @invoice], notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to [@division, @invoice], notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private

  def set_division
    @division = Division.find(params[:division_id])
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

end
