=begin
  ajaxejemplo08_controller.rb
  Autor      : Edgar Gonzalez
  Version    : 1.0 
  Fecha      : 14 de noviembre del 2012
  Descripcion: Atiende clientes via AJAX y crea un atributo a ser renderizado 
               en la vista como response en formato texto al AJAX
=end 
class Ajaxejemplo08Controller < ApplicationController
 attr_accessor :nombre
 def index
   @nombre = "Respuesta del Servidor: Bienvenido " + params[:nombre].to_s
 end
 
end