class MenuEnsambladora < ActiveRecord::Base
  
  def ContarHijos(tipo,padreid)
   @son = MenuEnsambladora.count(:all, :select => 'count(*) ', :conditions => "tipo=#{tipo} and padre_id=#{padreid}" )
   return @son
  end
  
  def ObtenerHijos(tipo,padreid)
			totaldeRegistros = self.ContarHijos(tipo,padreid)
			if totaldeRegistros>0
				@tira = @tira+"  children: [ "
				@menu_ensambladora = MenuEnsambladora.find(:all, :conditions => "tipo=#{tipo} and padre_id=#{padreid}" )
				j=0
				@menu_ensambladora.each do |menu_ensambladora|
					@tira = @tira+" { text: '" + menu_ensambladora.text + "', id: '" + menu_ensambladora.id.to_s  + "', href: '"+menu_ensambladora.vinculo+"', "
					self.ObtenerHijos(tipo,menu_ensambladora.id)
					j=j+1
     if j<totaldeRegistros
      @tira = @tira+" }, "
     else
      @tira = @tira+" } ] "
					end
				end
			else
				@tira = @tira+"  leaf: true  "
			end
  end
			                   
		def BuscarTodosArbolJson(tipo)
			@menu_ensambladora = MenuEnsambladora.new
			totaldeRegistros = self.ContarHijos(tipo,0);
			@tira='[ '
   if totaldeRegistros>0
				@menu_ensambladora = MenuEnsambladora.find(:all, :conditions => "tipo=#{tipo} and padre_id=0" )
				j=0
				@menu_ensambladora.each do |menu_ensambladora|
					@tira = @tira+" { text: '" + menu_ensambladora.text + "', id: '" + menu_ensambladora.id.to_s  + "', href: '', "
					self.ObtenerHijos(tipo,menu_ensambladora.id)
					j=j+1
     if j<totaldeRegistros
      @tira = @tira+ " }, "
     else
      @tira = @tira+" } ] "
					end
				end
			else
			 @tira= @tira+"{ { text: 'No hay datos', id: '0', href: '', leaf: true } } ]"
			end
			return @tira
		end

end