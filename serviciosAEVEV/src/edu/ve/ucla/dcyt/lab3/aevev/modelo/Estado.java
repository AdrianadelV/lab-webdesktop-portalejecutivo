package edu.ve.ucla.dcyt.lab3.aevev.modelo;

import java.io.Serializable;
import java.lang.Integer;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Estado
 *
 */
@Entity
@Table(name="estado",schema="public")
public class Estado implements Serializable {

	   
	@Id
	@SequenceGenerator(schema="public",name="GENERADOR_IDESTADO",allocationSize=1,sequenceName="IDESTADO")
	@GeneratedValue(generator="GENERADOR_IDESTADO",strategy=GenerationType.SEQUENCE)
	private Integer id_estado;
	@Column(name="nombre",nullable=false,unique=true)
	private String nombre;
	private static final long serialVersionUID = 1L;

	public Estado() {
		super();
	}   
	public Integer getId_estado() {
		return this.id_estado;
	}

	public void setId_estado(Integer id_estado) {
		this.id_estado = id_estado;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((id_estado == null) ? 0 : id_estado.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Estado other = (Estado) obj;
		if (id_estado == null) {
			if (other.id_estado != null)
				return false;
		} else if (!id_estado.equals(other.id_estado))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
    
}
