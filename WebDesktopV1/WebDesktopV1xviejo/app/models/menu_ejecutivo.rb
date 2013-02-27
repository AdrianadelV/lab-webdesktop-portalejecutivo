class Menu_ejecutivo < ActiveRecord::Base
  
  def ContarHijos(tipo,padreid)
   @son = Menu_ejecutivo.count(:all, :select => 'count(*) ', :conditions => "tipo=#{tipo} and padre_id=#{padreid}" )
   return @son
  end
  
  def ObtenerHijos(tipo,padreid)
      totaldeRegistros = self.ContarHijos(tipo,padreid)
      if totaldeRegistros>0
        @tira = @tira+"  children: [ "
        @arbols = Menu_ejecutivo.find(:all, :conditions => "tipo=#{tipo} and padre_id=#{padreid}" )
        j=0
        @arbols.each do |arbol|
          @tira = @tira+" { text: '" + arbol.text + "', id: '" + arbol.id.to_s  + "', href: '"+arbol.vinculo+"', "
          self.ObtenerHijos(tipo,arbol.id)
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
      @arbols = Menu_ejecutivo.new
      totaldeRegistros = self.ContarHijos(tipo,0);
      @tira='[ '
   if totaldeRegistros>0 
        @arbols = Menu_ejecutivo.find(:all, :conditions => "tipo=#{tipo} and padre_id=0" )
        j=0
        @arbols.each do |arbol|
          @tira = @tira+" { text: '" + arbol.text + "', id: '" + arbol.id.to_s  + "', href: '', "
          self.ObtenerHijos(tipo,arbol.id)
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