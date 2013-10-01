class ReceiptsController < ApplicationController
  # GET /receipts
  # GET /receipts.json

  before_filter :set_receipt, only: [:show, :edit, :update, :destroy]
  before_filter :set_division, only: [:index, :new, :create, :show, :edit, :update]

  def index
    @receipts = Receipt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receipts }
    end
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipt }
    end
  end

  # GET /receipts/new
  # GET /receipts/new.json
  def new
    @receipt = @division.receipts.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receipt }
    end
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = @division.receipts.new(params[:receipt])

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to [@division, @receipt], notice: 'Receipt was successfully created.' }
        format.json { render json: @receipt, status: :created, location: @receipt }
      else
        format.html { render action: "new" }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receipts/1
  # PUT /receipts/1.json
  def update

    respond_to do |format|
      if @receipt.update_attributes(params[:receipt])
        format.html { redirect_to [@division, @receipt], notice: 'Receipt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to receipts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_division
    @division = Division.find(params[:division_id])
  end

  def set_receipt
    @receipt = Invoice.find(params[:id])
  end

end
