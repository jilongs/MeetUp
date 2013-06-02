class JoinGroupsController < ApplicationController
  before_filter :authorize_user, only: [:edit, :update, :destroy]

  def authorize_user
    join_group = JoinGroup.find(params[:id])

    if join_group.user != current_user
      redirect_to meets_url, notice: "Nice try, Jeff."
    end
  end
  # GET /join_groups
  # GET /join_groups.json
  def index
    @join_groups = JoinGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @join_groups }
    end
  end

  # GET /join_groups/1
  # GET /join_groups/1.json
  def show
    @join_group = JoinGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @join_group }
    end
  end

  # GET /join_groups/new
  # GET /join_groups/new.json
  def new
    @join_group = JoinGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @join_group }
    end
  end

  # GET /join_groups/1/edit
  def edit
    @join_group = JoinGroup.find(params[:id])
  end

  # POST /join_groups
  # POST /join_groups.json
  def create
    @join_group = JoinGroup.new(params[:join_group])
    @join_group.user_id = session[:user_id]

    respond_to do |format|
      if @join_group.save
        format.html { redirect_to @join_group, notice: 'Join group was successfully created.' }
        format.json { render json: @join_group, status: :created, location: @join_group }
      else
        format.html { render action: "new" }
        format.json { render json: @join_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /join_groups/1
  # PUT /join_groups/1.json
  def update
    @join_group = JoinGroup.find(params[:id])

    respond_to do |format|
      if @join_group.update_attributes(params[:join_group])
        format.html { redirect_to @join_group, notice: 'Join group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @join_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_groups/1
  # DELETE /join_groups/1.json
  def destroy
    @join_group = JoinGroup.find(params[:id])
    @join_group.destroy

    respond_to do |format|
      format.html { redirect_to join_groups_url }
      format.json { head :no_content }
    end
  end
end
