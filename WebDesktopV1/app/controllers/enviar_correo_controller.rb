class EnviarCorreoController < ApplicationController
  require 'rubygems'
  require 'pony'
  skip_before_filter :verify_authenticity_token, :only => [:ipn_notification]
  def index
  end
  def enviarcorreo
    @email=params[:correo]
    puts @email
    Pony.mail(:to => @email, :via => :smtp, :via_options => {
    :address => 'smtp.gmail.com',
    :port => '587',
    :enable_starttls_auto => true,
    :user_name => 'laboratoriotresdidactico',
    :password => 'laboratorio123',
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain => "pop.gmail.com", # don't know exactly what should be here
    },
    :subject => '****SIAEVEV****Se ha Generado la Proforma', :body => 'SIAVEV ----> Su Proforma ha sido Generada Satisfactoriamente!!
    Su tiempo de espera son alrededor de 30 dias,para la aprobacion de su Credito')
  end 
  def enviarcorreo_nuevousuario
    @nombres=params[:nombres]
    @apellidos=params[:apellidos]
    @nusuario=params[:nusuario]
    @password=params[:password]
    @email=params[:correo] #correo del destinatario
    Pony.mail(:to => @email, :via => :smtp, :via_options => {
    :address => 'smtp.gmail.com',
    :port => '587',
    :enable_starttls_auto => true,
    :user_name => 'laboratoriotresdidactico', #usuario gmail
    :password => 'laboratorio123',            #password gmail
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain => "pop.gmail.com", # pop.gmail.com
    },
    :subject => '****SIAEVEV****Se ha Creado un Nuevo Usuario', :body => '
    Su Cuenta de Usuario ha sido Generada Satisfactoriamente!!
    ________________________________________________________________________
    Bienvenido '+@nombres+' '+@apellidos+''+' a ****SIAEVEV****
    ------------------------------------------------------------------------
    TU CUENTA DE USUARIO ES :'+@nusuario+'
    TU PASSWORD ES :'+@password+' 
    ------------------------------------------------------------------------
    Para logearte en tu cuenta con el siguiente link
    http://localhost:3000/inicio
    Para mas informacion Llamar al 0500-SIAEVEV')
  end 
  def enviarcorreo_nuevoindicador
    @nombres=params[:nombres]
    @apellidos=params[:apellidos]
    @email=params[:correo] #correo del destinatario que llega por parametros ajax
    Pony.mail(:to => @email, :via => :smtp, :via_options => {
    :address => 'smtp.gmail.com',
    :port => '587',
    :enable_starttls_auto => true,
    :user_name => 'laboratoriotresdidactico', #usuario gmail
    :password => 'laboratorio123',            #password gmail
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain => "pop.gmail.com", # pop.gmail.com
    },
    :subject => '****SIAEVEV****Se ha Creado un Nuevo Usuario', :body => 'SIAVEV ----> Su Cuenta de Usuario ha sido Generada Satisfactoriamente!!
    Bienvenido a ****SIAEVEV****')
  end 
end