package edu.ve.ucla.dcyt.lab3.aevev.json.servicio;

import java.util.List;

import javax.persistence.Persistence;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import edu.ve.ucla.dcyt.lab3.aevev.json.transformador.CiudadTransformer;
import edu.ve.ucla.dcyt.lab3.aevev.modelo.Ciudad;

@Path("/Ciudades")
public class CiudadService {

	@GET
	@Path("/buscarCiudad")
	@Produces("application/json")
	public String buscarCiudad(@QueryParam("id_ciudad")String id_ciudad){
		if (id_ciudad!=null) {
			if (!id_ciudad.equals("")) {
				String ciudadesJson=null;
				List<Ciudad> lista_Ciudades=Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select ciu from Ciudad ciu where id_ciudad='"+id_ciudad+"'").getResultList();
				ciudadesJson = CiudadTransformer.transformerToJSON(lista_Ciudades);
				return ciudadesJson;
			}else{
				return null;
			}
			
		}else{
			return null;
		}
	}
	@GET
	@Path("/buscarCiudadesEstado")
	@Produces("application/json")
	public String buscarCiudadesEstado(@QueryParam("estado")String estado) {
		if (estado!=null) {
			if (!estado.equals("")) {
				String ciudadesJson=null;
				List<Ciudad> lista_ciudades=Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select ciu from Ciudad ciu where estado='"+estado+"'").getResultList();
				ciudadesJson = CiudadTransformer.transformerToJSON(lista_ciudades);
				return ciudadesJson;
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
}
