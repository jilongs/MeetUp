class JoinMeetsController < ApplicationController
  before_filter :authorize_user, only: [:edit, :update, :destroy]

  def authorize_user
    join_meet = JoinMeet.find(params[:id])

    if join_meet.user != current_user
      redirect_to meets_url, notice: "Nice try, Jeff."
    end
  end
  # GET /join_meets
  # GET /join_meets.json
  def index
    @join_meets = JoinMeet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @join_meets }
    end
  end

  # GET /join_meets/1
  # GET /join_meets/1.json
  def show
    @join_meet = JoinMeet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @join_meet }
    end
  end

  # GET /join_meets/new
  # GET /join_meets/new.json
  def new
    @join_meet = JoinMeet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @join_meet }
    end
  end

  # GET /join_meets/1/edit
  def edit
    @join_meet = JoinMeet.find(params[:id])
  end

  # POST /join_meets
  # POST /join_meets.json
  def create
    @join_meet = JoinMeet.new(params[:join_meet])
    @join_meet.user_id = session[:user_id]
    respond_to do |format|
      if @join_meet.save
        format.html { redirect_to @join_meet, notice: 'Join meet was successfully created.' }
        format.json { render json: @join_meet, status: :created, location: @join_meet }
      else
        format.html { render action: "new" }
        format.json { render json: @join_meet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /join_meets/1
  # PUT /join_meets/1.json
  def update
    @join_meet = JoinMeet.find(params[:id])

    respond_to do |format|
      if @join_meet.update_attributes(params[:join_meet])
        format.html { redirect_to @join_meet, notice: 'Join meet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @join_meet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_meets/1
  # DELETE /join_meets/1.json
  def destroy
    @join_meet = JoinMeet.find(params[:id])
    @join_meet.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to join_meets_url }
      format.json { head :no_content }
    end
  end
end
