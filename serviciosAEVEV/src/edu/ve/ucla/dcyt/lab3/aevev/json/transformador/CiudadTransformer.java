package edu.ve.ucla.dcyt.lab3.aevev.json.transformador;

import java.util.List;

import com.google.gson.Gson;

public class CiudadTransformer {

	public static String transformerToJSON(List ciudades ) {
		String ciudadesJson = null;
		Gson gson = new Gson();
		ciudadesJson = gson.toJson(ciudades);
		return ciudadesJson;
	}
}
