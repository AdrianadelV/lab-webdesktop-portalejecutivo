package edu.ve.ucla.dcyt.lab3.aevev.modelo;

import java.io.Serializable;
import java.lang.Integer;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Ciudad
 *
 */
@Entity
@Table(name="ciudad",schema="public")
public class Ciudad implements Serializable {

	   
	@Id
	@SequenceGenerator(schema="public",name="GENERADOR_IDCIUDAD",allocationSize=1,sequenceName="IDCIUDAD")
	@GeneratedValue(generator="GENERADOR_IDCIUDAD",strategy=GenerationType.SEQUENCE)
	private Integer id_ciudad;
	@Column(name="nombre",nullable=false,unique=true)
	private String nombre;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "estado", nullable = false)
	private Estado estado;
	
	private static final long serialVersionUID = 1L;

	public Ciudad() {
		super();
	}   
	public Integer getId_ciudad() {
		return this.id_ciudad;
	}

	public void setId_ciudad(Integer id_ciudad) {
		this.id_ciudad = id_ciudad;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Estado getEstado() {
		return estado;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((estado == null) ? 0 : estado.hashCode());
		result = prime * result
				+ ((id_ciudad == null) ? 0 : id_ciudad.hashCode());
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
		Ciudad other = (Ciudad) obj;
		if (estado == null) {
			if (other.estado != null)
				return false;
		} else if (!estado.equals(other.estado))
			return false;
		if (id_ciudad == null) {
			if (other.id_ciudad != null)
				return false;
		} else if (!id_ciudad.equals(other.id_ciudad))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
	
    
}
