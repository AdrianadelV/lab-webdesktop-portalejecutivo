package edu.ve.ucla.dcyt.lab3.aevev.json.servicio;

import java.util.List;

import javax.persistence.Persistence;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.eclipse.jdt.internal.compiler.ast.IfStatement;

import edu.ve.ucla.dcyt.lab3.aevev.json.transformador.EstadoTransformer;
import edu.ve.ucla.dcyt.lab3.aevev.modelo.Estado;

@Path("/Estados")
public class EstadoService {

	@GET
	@Path("/buscarEstado")
	@Produces("application/json")
	public String buscarEstado(@QueryParam("id_estado")String id_estado){
		if (id_estado!=null) {
			if(!id_estado.equals("")){
				if (id_estado.equals("*")) {
					String estadosJson=null;
					List<Estado> lista_Estados = Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select est from Estado est").getResultList();
					estadosJson = EstadoTransformer.transformerToJSON(lista_Estados);
					return estadosJson;
				}else{
					String estadosJson=null;
					List<Estado> lista_Estados = Persistence.createEntityManagerFactory("serviciosAEVEV").createEntityManager().createQuery("select est from Estado est where id_estado= '"+id_estado+"'").getResultList();
					estadosJson = EstadoTransformer.transformerToJSON(lista_Estados);
					return estadosJson;
				}
			}else{
				return null;
			}
		}else{
			return null;
		}
		
	}
	
}
