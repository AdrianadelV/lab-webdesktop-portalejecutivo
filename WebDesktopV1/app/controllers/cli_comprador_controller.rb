require "libreria"
require 'mypdf'
require 'Array2D'

class CliCompradorController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rols_id]==2)
      redirect_to '/concesionario'
    elsif(session[:rols_id]==3)
      redirect_to '/menu_ensambladora'
    elsif(session[:rols_id]==4)
      redirect_to '/menu_admin'
    end
  end

  def generarmenu
    @tipo=params[:tipo]
    @arbols = Arbols.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
   def buscarUsuarioLo
   @usuarios = Usuario.new
   valor = @usuarios.buscarUsuarioLo(session[:nombre])
  end
  def buscarComprador
    buscarUsuarioLo()
    parsed_json = ActiveSupport::JSON.decode($tirajson)
    @comprador=Comprador_Vehiculo.new
    valor=@comprador.buscarUsuarioComprador(parsed_json["id"])
    render :text => $tirajson 
  end
  
  def grabarComprador  
    @comprador= Comprador_Vehiculo.new
    parsed_json = ActiveSupport::JSON.decode($tirajson)
    @cedula=params[:cedula]
    @nombres=params[:nombres]
    @apellidos=params[:apellidos]
    @telefono=params[:telefono]
    @direccion=params[:direccion]
    @correo=params[:correo]
    @fecha_nacimiento=params[:fecha_nacimiento]
    @sexo=params[:sexo]
    @comprador.grabarComprador(@cedula,@nombres,@apellidos,@telefono,@direccion,@correo,@fecha_nacimiento,@sexo)
    render :text => $tirajson
  end
  
  def modificarContrasena
    @usuario = Usuario.new
    @nombre = params[:nombre]
    @canterior=params[:canterior]
    @cnueva=params[:cnueva]
    @usuario.modificarContrasena(@nombre,@canterior,@cnueva,)
    render :text => $tirajson
  end
  def imprimir_proforma
     # Crear el objeto pdf de la clase Mypdf
   # Orientacion: P = Portrait y L = Landscape
   # Unidad: pt=punto, mm=milimetros, cm=centimetro, in=pulgada
   #         Un punto es igual a 1/72 de pulgada, es decir cerca de 0.35 mm (siendo una pulgada 2.54 cm).
   # Formato = A3,A4,A5,Letter o Legal
   # Por Defecto es: P,mm,Letter, creando el objeto pdf = Mypdf.new
   @orientacion = 'L'
   @unidad = 'mm'
   @formato = 'A4'
   pdf = Mypdf.new(@orientacion,@unidad,@formato)
   pdf.AliasNbPages 
   # Titulos de las Columnas
   @header = ['Nombres', 'Apellidos', 'Telefono','Direccion','Correo','Banco']
   @header2 = ['Banco','Vehiculo','Modelo','Color','Precio']
   # Cargar los datos de la tabla usuarios en @data cada posicion de data es un arreglo
   @data = Array.new
   @data2= Array.new
   @objetoUsuarios=Comprador_Vehiculo.find(:first, :conditions => "nombres='#{params[:nombres]}'")
   puts @objetoUsuarios.nombres
   puts"*******************************************"
   #objetoUsuarios.each do |comprador|
    @banco=params[:banco]
    @registro = Array.new
    @registrovehiculo=Array.new
    @registro.push(@objetoUsuarios.nombres.to_s)
    @registro.push(@objetoUsuarios.apellidos.to_s)
    @registro.push(@objetoUsuarios.telefono.to_s)
    @registro.push(@objetoUsuarios.direccion.to_s)
    @registro.push(@objetoUsuarios.correo.to_s)
    @registro.push(@banco)
    @data2.push(@registrovehiculo)
    @data.push(@registro)
   #end
   # Definicion del encabezado
   # Definicion de la Fuente
   @font = Array.new
   @font[0] = 'Arial' # Fuente
   @font[1] = 'B'     # B=Negrita o Bold, I=italica, N=Normal
   @font[2] = 14      # Tamano
   # Logo al Tope izquierdo del Encabezado, Soporta imagenes: JPG y PNG
   @image1 = Array.new
   @image1[0] = 'public/images/carros1.jpg'
   @image1[1] = 10 # Columna
   @image1[2] = 5  # Fila
   @image1[3] = 8  # Amplitud
   @image1[4] = 13 # Altura
   # Logo al Tope Derecho del Encabezado
   @image2 = Array.new
   @image2[0] = 'public/images/carros1.jpg'
   @image2[1] = 180
   @image2[2] = 5
   @image2[3] = 8
   @image2[4] = 13
   # Definicion de la Primera Linea del Encabezado
   @xy1 = Array.new
   @xy1[0] = 80 # Columna
   @xy1[1] = 5  # Fila
   @title1 = Array.new
   @title1[0] = 40 # Amplitud
   @title1[1] = 5  # Altura
   @title1[2] = 'SOLICITUD DE CREDITO DE CREDITO PERSONA NATURAL' # Texto
   @title1[3] = 0 # Indica sin los border o lineas seran dibujados alrededor de la celda. 0=Sin Border 1=Con Border.
   @title1[4] = 0 # Indica la posicion antes de imprimir el texto, 0=A la derecha, 1=Al comienzo de la siguiente linea, 2=Debajo
   @title1[5] = 'C' # Alineacion del texto: C=Centrado, L=A la izquierda, R=Derecha
   @xy2 = Array.new
   @xy2[0] = 80
   @xy2[1] = 10
   @title2 = Array.new
   @title2[0] = 40
   @title2[1] = 5
   @title2[2] = 'SISTEMA DE ASIGNACION EQUITATIVA DE VEHICULOS EN VENEZUELA'
   @title2[3] = 0
   @title2[4] = 0
   @title2[5] = 'C'
   @xy3 = Array.new
   @xy3[0] = 80
   @xy3[1] = 15
   @title3 = Array.new
   @title3[0] = 40
   @title3[1] = 5
   @title3[2] = 'UNIVERSIDAD CENTROCCIDENTAL"LISANDRO ALVARADO"'
   @title3[3] = 0
   @title3[4] = 0
   @title3[5] = 'C'
   @xy4 = Array.new
   @xy4[0] = 80
   @xy4[1] = 20
   @title4 = Array.new
   @title4[0] = 40
   @title4[1] = 5
   @title4[2] = 'PROFORMA-SIAEVEV'
   @title4[3] = 0
   @title4[4] = 0
   @title4[5] = 'C'
   @lines = 20
   pdf.HeaderPage(@font,@image1,@image2,@xy1,@title1,@xy2,@title2,@xy3,@title3,@xy4,@title4,@lines)
   # Definicion del Pie de Pagina
   # Definicio de la Fuente
   @font = Array.new
   @font[0] = 'Arial'
   @font[1] = 'I'
   @font[2] = 8
   @yfooter = -15 # Define a cuantos cms del final estara el pie de pagina
   @footer = Array.new
   @footer[0] = 0  # Columna
   @footer[1] = 10 # Fila
   @footer[2] = 'Pagina: ' # Texto
   @footer[3] = 0 # Indica sin los border o lineas seran dibujados alrededor de la celda. 0=Sin Border 1=Con Border.
   @footer[4] = 0 # Indica la posicion antes de imprimir el texto, 0=A la derecha, 1=Al comienzo de la siguiente linea, 2=Debajo
   @footer[5] = 'C' # Alineacion del texto: C=Centrado, L=A la izquierda, R=Derecha
   pdf.FooterPage(@font,@yfooter,@footer)
   # Genera una Tabla Basica
   pdf.AddPage()
   pdf.BasicTable(@header, @data)
   # Genera una tabla más avanzada
   pdf.AddPage()
   # Define las caracteristicas de la celda del encabezado
   @wh = Array2D.new(3,5)
   @wh[0,0] = 40  # Amplitud
   @wh[0,1] = 7   # Altura
   @wh[0,2] = 1   # Indica sin los border o lineas seran dibujados alrededor de la celda. 0=Sin Border 1=Con Border.
   @wh[0,3] = 0   # Indica la posicion antes de imprimir el texto, 0=A la derecha, 1=Al comienzo de la siguiente linea, 2=Debajo
   @wh[0,4] = 'C' # Alineacion del texto: C=Centrado, L=A la izquierda, R=Derecha
   @wh[1,0] = 35
   @wh[1,1] = 7
   @wh[1,2] = 1
   @wh[1,3] = 0
   @wh[1,4] = 'C'
   @wh[2,0] = 40
   @wh[2,1] = 7
   @wh[2,2] = 1
   @wh[2,3] = 0
   @wh[2,4] = 'C'
   @wd = Array2D.new(3,5)
   @wd[0,0] = @wh[0,0]
   @wd[0,1] = 6
   @wd[0,2] = 'LR'
   @wd[0,3] = 0
   @wd[0,4] = 'R'
   @wd[1,0] = @wh[1,0]
   @wd[1,1] = 6
   @wd[1,2] = 'LR'
   @wd[1,3] = 0
   @wd[1,4] = 'R'
   @wd[2,0] = @wh[2,0]
   @wd[2,1] = 6
   @wd[2,2] = 'LR'
   @wd[2,3] = 0
   @wd[2,4] = 'R'
   pdf.ImprovedTable(@header2, @data2, @wh, @wd)
   # Tabla mas elegante, con definicion de colores y fuente por celda
   pdf.AddPage()
   # Color de fondo para el encabezado de las columnas, basado en el formato: RGB
   @fillcolor = Array.new
   @fillcolor[0] = 195 #255 R
   @fillcolor[1] = 234 #0   G
   @fillcolor[2] = 125 #0   B
   # Color de la fuente para el encabezado de las columnas
   @textcolor = 255 #255
   # Color de las lineas de la tabla
   @drawcolor = Array.new
   @drawcolor[0] = 128 #128
   @drawcolor[1] = 243 #0
   @drawcolor[2] = 89 #0
   # Grosor de las lineas de la tabla
   @linewidth=0.3 #0.3
   # Definicion de la Fuente para el encabezado de las columnas
   @font = Array.new
   @font[0] = 'Arial'
   @font[1] = 'B'
   @font[2] = 18 #18
   # Restaurar el Color y la fuente
   @fillcolorRestart = Array.new
   @fillcolorRestart[0] = 124 # 224
   @fillcolorRestart[1] = 135 # 235
   @fillcolorRestart[2] =  95 # 255
   @textcolorRestart=0
   @fontRestart = Array.new
   @fontRestart[0] = 'Arial'
   @fontRestart[1] = ''
   @fontRestart[2] = 12
   pdf.FancyTable(@header, @data, @wh, @wd, @fillcolor, @textcolor, @drawcolor, @linewidth, @font, @fillcolorRestart, @textcolorRestart, @fontRestart)
   # Se debe crear en la carpeta public la carpeta pdf y como super usuario cambiar
   # La propiedades 777 con el comando: chmod -R 777 pdf/
   $directorio='/home/fernando/Documents/Aptana Studio 3 Workspace/WebDesktopV1/public/'
   pdf.Output($directorio+'pdf/proforma_vehiculo.pdf')
   @tirajson = '{"success":true}'
   render :text => $tirajson
  end
end  
  
