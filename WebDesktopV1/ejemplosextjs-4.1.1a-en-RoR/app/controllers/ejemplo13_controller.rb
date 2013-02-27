=begin
  ejemplo01_controller.rb
  Autor      : Edgar Gonzalez
  Version    : 1.0 
  Fecha      : 14 de noviembre del 2012
  Descripcion: Clase básica para demostrar el uso de la Librería Sencha/Extjs
               Manejo de árbol para un menú dinámico con las opciones extraídos
               de una tabla de la BD. 
=end
class Ejemplo13Controller < ApplicationController
 
 def index
 end
	
 def generarmenu
		@tipo=params[:tipo]
		@arbols = Arbols.new
		@tira = @arbols.BuscarTodosArbolJson(@tipo)
		render :text => @tira
	end
end