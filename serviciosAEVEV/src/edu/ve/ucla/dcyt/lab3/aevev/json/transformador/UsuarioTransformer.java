package edu.ve.ucla.dcyt.lab3.aevev.json.transformador;

import java.util.List;

import com.google.gson.Gson;

public class UsuarioTransformer {
	
	public static String transformerToJSON(List usuarios){
		String usuariosJson = null;
		Gson gson = new Gson();
		usuariosJson = gson.toJson(usuarios);
		return usuariosJson;
	}

}
