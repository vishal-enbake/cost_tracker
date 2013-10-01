class DivisionsController < ApplicationController
  
  before_filter :set_division, only: [:show, :edit, :update, :destroy]
  before_filter :set_project, only: [:index, :new, :create, :show, :edit, :update]
  # GET /divisions
  # GET /divisions.json
  def index
    @divisions = @project.divisions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @divisions }
    end
  end

  # GET /divisions/1
  # GET /divisions/1.json
  def show
    @invoices = @division.invoices
    @receipts = @division.receipts
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @division }
    end
  end

  # GET /divisions/new
  # GET /divisions/new.json
  def new
    @division = @project.divisions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @division }
    end
  end

  # GET /divisions/1/edit
  def edit
  end

  # POST /divisions
  # POST /divisions.json
  def create
    @division = @project.divisions.new(params[:division])

    respond_to do |format|
      if @division.save
        debugger
        format.html { redirect_to [@project, @division], notice: 'Division was successfully created.' }
        format.json { render json: @division, status: :created, location: @division }
      else
        format.html { render action: "new" }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /divisions/1
  # PUT /divisions/1.json
  def update
    respond_to do |format|
      if @division.update_attributes(params[:division])
        format.html { redirect_to [@project, @division], notice: 'Division was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.json
  def destroy
    @division.destroy

    respond_to do |format|
      format.html { redirect_to divisions_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_division
    @division = Division.find(params[:id])
  end
  
  def set_project
    @project = Project.find(params[:project_id])
  end
end
