class ApplicationController < ActionController::Base
  protect_from_forgery

  def type_file_valid(file_name)
  	extension = extension(file_name)
  	ex = [".pdf", ".doc", ".docx", ".pptx", ".ppt", ".png", ".jpg" ]
  	return ex.include?(extension)
  end

  def extension(file_name)
    file_name.slice(file_name.rindex("."), file_name.length).downcase;
  end

  # Retorna el string de la ruta donde almacenara los archivos subidos al servidor
  def path_file(name)
  	return File.join(Rails.root,"files",name)
  end

  def norepeat(title, user)
    events = EventPermission.find_all_by_user_id_and_participant_type_id(user,1)
    events.each do |event|
      doc = Document.find_by_title_and_event_id(title, event.event_id)
      if doc
        return false
      end
    end
    return true
  end

end
