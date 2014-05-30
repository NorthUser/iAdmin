class EventsController < ApplicationController
  before_filter :permission_filter, :except => [:create, :update, :update_file, :list_participant_type, :list_users, :addParticipante, :change_attribute_doc, :download, :upload, :delete_file, :show]
  before_filter :session_filter, :only => [:create, :update, :update_file, :list_participant_type, :list_users, :addParticipante, :change_attribute_doc, :download, :upload, :delete_file]
  # GET /events
  # GET /events.json
  def index
    roles = ParticipantType.all
    @events = {}
    roles.each do |role|
      @events[role.name] = Event.find(EventPermission.find_all_by_user_id_and_participant_type_id(session[:id], role.id).map{|ep| ep.event_id})
    end
    # @events = Event.find(EventPermission.find_all_by_user_id(session[:id]).map{|ep| ep.event_id})
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @w = EventPermission.find_by_user_id_and_event_id(session[:id], params[:id]).participant_type.type_access.include?('w')
    @r = EventPermission.find_by_user_id_and_event_id(session[:id], params[:id]).participant_type.type_access.include?('r')
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @w = EventPermission.find_by_user_id_and_event_id(session[:id], params[:id]).participant_type.type_access.include?('w')
    @r = EventPermission.find_by_user_id_and_event_id(session[:id], params[:id]).participant_type.type_access.include?('r')
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    respond_to do |format|
      if @event.save
        role = EventPermission.new
        role.event_id = @event.id
        role.user_id = session[:id]
        role.participant_type_id = 1
        role.save
        format.html { redirect_to @event, notice: 'Se guardo correctamente.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Evento '+@event.title+' actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def update_file
    file = params[:file]
    doc = Document.find(params[:file_id])
    msg = ""
    name = file.original_filename
    if type_file_valid(name)
      if File.exist?(path_file(doc.url))
        File.delete(path_file(doc.url))
      end
      resultado = File.open(path_file(name), "wb") { |f| f.write(file.read) }
      if resultado
        doc.url = name
        msg += (name+" Se actualizo con exito!!") if doc.save
      else
        msg += "Ocrurrio un error durante la actualizacion, porfavor vuelva a intentarlo."
      end
    else
      msg += "El tipo de archivo no es valido"
    end
    redirect_to :back, notice: msg
  end

  def delete_file
    doc = Document.find(params[:id])
    msg = ""
    if doc
      if File.exist?(path_file(doc.url))
        resultado = File.delete(path_file(doc.url))
        if resultado
          doc.destroy
          msg += "Exito!! se elimino correctamente"
        else
          msg += "No se pudo eliminar el archivo"
        end
      else
        doc.destroy
        msg += "No existe el fichero, se elimino el registro"
      end
    end
    redirect_to :back, notice: msg
  end

  def upload
    files = params[:file]
    msg = ""
    count = 0
    if files.size == params[:titulos].size
      files.each do |file|
        norepeat = norepeat(params[:titulos][count], session[:id])
        name = file.original_filename
        if type_file_valid(name)
          resultado = (File.open(path_file(name), "wb") { |f| f.write(file.read) }) if norepeat
          if norepeat
            doc = Document.new
            doc.event_id = params[:id]
            doc.title = params[:titulos][count]
            doc.url = name
            doc.type_attribute = "controlado"
            msg += (name+" Se subio con exito!!") if doc.save
          else
            msg = msg + name + " Se a subido un archivo titulado "+params[:titulos][count]+", en el evento anterior si no es el mismo contenido favor de intentar nuevamente"
          end
        end
        count += 1
      end
    else
      msg += "Ingrese un titulo para cada archivo"
    end
    redirect_to :back, notice: msg
  end

  def download
    doc = Document.find(params[:id])
    if doc.type_attribute == "publico"
      send_file path_file(doc.url), :filename => doc.title+extension(doc.url)
    elsif doc.event_id != nil
      role = EventPermission.find_by_event_id_and_user_id(doc.event_id, session[:id])
      if role
        if role.participant_type.type_access.include?("r")
          send_file path_file(doc.url), :filename => doc.title+extension(doc.url)
        end
      end
    end
  end

  def change_attribute_doc
    doc = Document.find(params[:id])
    role = EventPermission.find_by_event_id_and_user_id(params[:event], session[:id])
    if role
      if role.participant_type.type_access.include?("w")
        doc.type_attribute = (doc.type_attribute == "publico")? "controlado" : "publico"
        if doc.save
          redirect_to :back, notice: 'El Documento '+doc.title+' cambio a ser un documento '+doc.type_attribute
        end
      end
    else
      redirect_to :back, notice: 'No se tienen permisos sobre este archivo, si cree que esto es un error comuniquese con el departamento de sistemas'
    end
  end

  def addParticipante
    role = EventPermission.new
    role.participant_type_id = params[:roles]
    role.user_id = params[:user]
    role.event_id = params[:event]
    if role.save
      render json:{:success => true}
    else
      render json:{:success => false}
    end
  end

  # POST rescata la lista de usuarios con nombre para un dropdown
  def list_users
    user = User.all.map { |user| {:id => user.id, :full_name => user.person.full_name} }
    render json: user
  end

  def list_participant_type
    pt = ParticipantType.all.map { |pt| {:id => pt.id, :full_name => pt.name} }
    render json: pt
  end


end
