module ApplicationHelper

  # Formato de fechas
  FECHA_FORMATO1 = '%d/%m/%Y'
  FECHA_FORMATO2 = '%d/%m/%Y - %H:%M'
  FECHA_FORMATO3 = '%d-%m-%Y'
  FECHA_FORMATO4 = '%d-%m-%Y - %H:%M'
  FECHA_FORMATO5 = '%l:%M %p, %B %d, %Y'
  FECHA_FORMATO6 = '%d/%m/%Y - %l:%M %p'
  FECHA_FORMATO7 = '%d/%m/%Y a las %l:%M %p'
  FECHA_SQL = "%Y-%m-%d %H:%M"
  #Date.today.strftime("%Y/%m/%d - %l:%M %p")

  def date_format(fecha, formato)
    fecha.strftime(formato)
  end

  # Fecha por default, para usar la misma en todos los index de datos
  def date_natural(fecha)
    if fecha
      fecha.strftime(FECHA_FORMATO1)
    else
      '-'
    end
  end

  def datetime_natural(fecha)
    if fecha
      fecha.strftime(FECHA_FORMATO6)
    else
      '-'
    end
  end

  def datetime_event(fecha)
    if fecha
      fecha.strftime(FECHA_FORMATO7)
    else
      '-'
    end
  end

  def status(val)
    if val
      'Activo'
    else
      'Inactivo'
    end
  end

  def is_null(val)
    if val == nil
      '--'
    else
      val
    end
  end

  def is_cheked(boolean)
    (boolean)? 'checked' : ''
  end

  def in_session
    if session[:id]
      return true
    else
      return false
    end
  end

  def is_chunk(key)
    if session[:id]
      user = User.find(session[:id])
      if user
        return user.profile.permissions.include?(key)
      else
        return false
      end
    else
      return false
    end
  end

end
