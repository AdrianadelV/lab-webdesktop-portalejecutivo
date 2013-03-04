package edu.ve.ucla.dcyt.lab3.aevev.json.servicio;

import java.util.List;

import javax.persistence.Persistence;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import edu.ve.ucla.dcyt.lab3.aevev.json.transformador.RolTransformer;
import edu.ve.ucla.dcyt.lab3.aevev.modelo.RolUsuario;

@Path("/RolesUsuario")
public class RolUsuarioService {
	@GET
	@Path("/buscarRolUsuario")
	@Produces("application/json")
	public String buscarEstado(@QueryParam("id_rol")String id_rol){
		if (id_rol!=null) {
			if(!id_rol.equals("")){
				if (id_rol.equals("*")) {
					String rolesJson=null;
					List<RolUsuario> lista_roles = Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select rol from RolUsuario rol").getResultList();
					rolesJson = RolTransformer.transformerToJSON(lista_roles);
					return rolesJson;
				}else{
					String rolesJson=null;
					List<RolUsuario> lista_roles = Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select rol from RolUsuario rol where id_rol= '"+id_rol+"'").getResultList();
					rolesJson = RolTransformer.transformerToJSON(lista_roles);
					return rolesJson;
				}
			}else{
				return null;
			}
		}else{
			return null;
		}
		
	}
}
