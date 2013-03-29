class EnviarCorreoController < ApplicationController
  require 'rubygems'
  require 'pony'
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
    :subject => 'Se ha Enviado la Proforma', :body => 'SIAVEV ----> Su Proforma ha sido Generada Satisfactoriamente!!')
  end 
end