class HomeController < ApplicationController
  def index
  end

  def acerca_de
  end

  # POST home/login
  # Realiza procedimiento de validacion de usuario y crea la variable de sesion en caso de autentificarse correctamente
  def login
  	user = User.find_by_username(params[:username])
  	if user
  		if user.password == params[:password]
  			session[:user] = user.username
  			session[:id] = user.id
        session[:full_name] = user.person.full_name
        session[:initials] = user.person.initials
        session[:academic_degree] = user.person.academic_degree
  		end
  	end
  	redirect_to home_index_path
  end

  # GET home/logout
  # Limpia variable de sesion
  def logout
    # Se limpia la variable de sesion
    reset_session
    # Redirecciona al indes de la web
    redirect_to home_index_path
  end

  def acceso_denegado

  end

end
