package edu.ve.ucla.dcyt.lab3.aevev.json.transformador;

import java.util.List;

import com.google.gson.Gson;

public class EstadoTransformer {

	public static String transformerToJSON(List estados) {
		String estadosJson = null;
		Gson gson = new Gson();
		estadosJson = gson.toJson(estados);
		return estadosJson;
	}
}
