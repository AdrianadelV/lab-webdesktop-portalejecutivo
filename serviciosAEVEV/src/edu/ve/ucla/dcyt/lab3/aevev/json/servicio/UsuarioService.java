package edu.ve.ucla.dcyt.lab3.aevev.json.servicio;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import edu.ve.ucla.dcyt.lab3.aevev.exception.ServiceParamException;
import edu.ve.ucla.dcyt.lab3.aevev.exception.ServiceSqlException;
import edu.ve.ucla.dcyt.lab3.aevev.json.transformador.UsuarioTransformer;
import edu.ve.ucla.dcyt.lab3.aevev.modelo.Ciudad;
import edu.ve.ucla.dcyt.lab3.aevev.modelo.RolUsuario;
import edu.ve.ucla.dcyt.lab3.aevev.modelo.Usuario;

@Path("/Usuarios")
public class UsuarioService {
	
	@GET
	@Path("/autenticarUsuario")
	@Produces("application/json")
	public String autenticarUsuario(@QueryParam("login")String login,@QueryParam("contrasena")String contrasena){
		System.out.println(login+" -  "+contrasena);
		if (login!=null && contrasena!=null){
			if(!login.equals("")&&!contrasena.equals("")){
				String usuariosJson=null;
				List<Usuario> lista_usuarios = Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select usu from Usuario usu where nombre_login='"+login+"' and contrasena='"+contrasena+"'").getResultList();
				usuariosJson = UsuarioTransformer.transformerToJSON(lista_usuarios);
				return usuariosJson;
			}else{
				return ServiceParamException.ERROR_PARAMETROS_VACIOS;
			}
		}else{
			return ServiceParamException.ERROR_FALTA_PARAMETROS;
		}
		
	}

	@GET
	@Path("/registrarUsuario")
	@Produces("application/json")
	public String registrarUsuario(@QueryParam("nombre_login")String nombre_login,@QueryParam("nombre")String nombre,@QueryParam("cedula")String cedula,@QueryParam("direccion")String direccion,@QueryParam("fecha_nacimiento")String fecha_nacimiento,@QueryParam("sexo")String sexo,@QueryParam("contrasena")String contrasena,@QueryParam("email")String email,@QueryParam("telefono")String telefono,@QueryParam("id_ciudad")String id_ciudad,@QueryParam("id_rolusuario")String id_rolusuario){
		if (nombre_login!=null && nombre!=null && cedula!=null && fecha_nacimiento!=null && sexo!=null && contrasena!=null && email!=null && telefono!=null && id_ciudad!=null && id_rolusuario!=null){
			if (!nombre_login.equals("") && !nombre.equals("") && !cedula.equals("") && !fecha_nacimiento.equals("") && !sexo.equals("") && !contrasena.equals("") && !email.equals("") && !telefono.equals("") && !id_ciudad.equals("") && !id_rolusuario.equals("")) {
				Usuario usuario = new Usuario();
				try {
					usuario.setSexo(sexo.toUpperCase().charAt(0));
				} catch (Exception e) {
					return ServiceParamException.ERROR_PARAMETRO_CHAR;
				}
				try {
					Ciudad ciudad=(Ciudad)Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select ciu from Ciudad ciu where id_ciudad='"+id_ciudad+"'").getResultList().get(0);
					RolUsuario rol=(RolUsuario)Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select rol from RolUsuario rol where id_rol='"+id_rolusuario+"'").getResultList().get(0);
					usuario.setCiudad(ciudad);usuario.setRolusuario(rol);
				} catch (Exception e) {
					return ServiceSqlException.ERROR_INSERCION;
				}
				usuario.setCedula(cedula);usuario.setNombre_login(nombre_login);usuario.setNombre(nombre);usuario.setFecha_nacimiento(new Date(fecha_nacimiento));usuario.setDireccion(direccion);usuario.setEmail(email);usuario.setTelefono(telefono);usuario.setContrasena(contrasena);
				EntityManager em = Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager(); 
				try {
					em.getTransaction().begin();
					em.persist(usuario);
					em.getTransaction().commit();
				} catch (Exception e) {
					return  ServiceSqlException.ERROR_INSERCION;
				}
				List<Usuario> lista_usuario = em.createQuery("select usu from Usuario usu where nombre_login='"+usuario.getNombre_login()+"'").getResultList();
				return UsuarioTransformer.transformerToJSON(lista_usuario);
			}else{
				return ServiceParamException.ERROR_PARAMETROS_VACIOS;
			}
		}else{
			return ServiceParamException.ERROR_FALTA_PARAMETROS;
		}	
	}
}


