package edu.ve.ucla.dcyt.lab3.aevev.json.transformador;

import java.util.List;

import com.google.gson.Gson;

public class RolTransformer {
	public static String transformerToJSON(List roles) {
		String rolesJson = null;
		Gson gson = new Gson();
		rolesJson = gson.toJson(roles);
		return rolesJson;
	}
}
