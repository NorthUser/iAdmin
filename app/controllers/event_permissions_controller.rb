class EventPermissionsController < ApplicationController
  # GET /event_permissions
  # GET /event_permissions.json
  def index
    @event_permissions = EventPermission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_permissions }
    end
  end

  # GET /event_permissions/1
  # GET /event_permissions/1.json
  def show
    @event_permission = EventPermission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_permission }
    end
  end

  # GET /event_permissions/new
  # GET /event_permissions/new.json
  def new
    @event_permission = EventPermission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_permission }
    end
  end

  # GET /event_permissions/1/edit
  def edit
    @event_permission = EventPermission.find(params[:id])
  end

  # POST /event_permissions
  # POST /event_permissions.json
  def create
    @event_permission = EventPermission.new(params[:event_permission])

    respond_to do |format|
      if @event_permission.save
        format.html { redirect_to @event_permission, notice: 'Event permission was successfully created.' }
        format.json { render json: @event_permission, status: :created, location: @event_permission }
      else
        format.html { render action: "new" }
        format.json { render json: @event_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_permissions/1
  # PUT /event_permissions/1.json
  def update
    @event_permission = EventPermission.find(params[:id])

    respond_to do |format|
      if @event_permission.update_attributes(params[:event_permission])
        format.html { redirect_to @event_permission, notice: 'Event permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_permissions/1
  # DELETE /event_permissions/1.json
  def destroy
    @event_permission = EventPermission.find(params[:id])
    @event_permission.destroy

    respond_to do |format|
      format.html { redirect_to event_permissions_url }
      format.json { head :no_content }
    end
  end
end
