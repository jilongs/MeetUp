class MeetsController < ApplicationController
  before_filter :authorize_user, only: [:edit, :update, :destroy]

  def authorize_user
    meet = Meet.find(params[:id])

    if meet.user != current_user
      redirect_to meets_url, notice: "Nice try, Jeff."
    end
  end
  # GET /meets
  # GET /meets.json
  def index
    @meets = Meet.paginate(:page => params[:page], :per_page => 5).order("date desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meets }
    end
  end

  # GET /meets/1
  # GET /meets/1.json
  def show
    @meet = Meet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meet }
    end
  end

  # GET /meets/new
  # GET /meets/new.json
  def new
    @meet = Meet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meet }
    end
  end

  # GET /meets/1/edit
  def edit
    @meet = Meet.find(params[:id])
  end

  # POST /meets
  # POST /meets.json
  def create
    @meet = Meet.new(params[:meet])
    @meet.user_id = session[:user_id]
    @meet.user_count = 0

    respond_to do |format|
      if @meet.save
        format.html { redirect_to @meet, notice: 'Meet was successfully created.' }
        format.json { render json: @meet, status: :created, location: @meet }
      else
        format.html { render action: "new" }
        format.json { render json: @meet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meets/1
  # PUT /meets/1.json
  def update
    @meet = Meet.find(params[:id])

    respond_to do |format|
      if @meet.update_attributes(params[:meet])
        format.html { redirect_to @meet, notice: 'Meet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meets/1
  # DELETE /meets/1.json
  def destroy
    @meet = Meet.find(params[:id])
    @meet.destroy

    respond_to do |format|
      format.html { redirect_to meets_url }
      format.json { head :no_content }
    end
  end
end
