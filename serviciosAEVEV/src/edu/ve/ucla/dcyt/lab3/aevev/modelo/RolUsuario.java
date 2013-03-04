package edu.ve.ucla.dcyt.lab3.aevev.modelo;

import java.io.Serializable;
import java.lang.Integer;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: RolUsuario
 *
 */
@Entity
@Table(name="rolusuario",schema="public")
public class RolUsuario implements Serializable {

	   
	@Id
	@SequenceGenerator(schema="public",name="GENERADOR_IDROLUSUARIO",allocationSize=1,sequenceName="IDROLUSUARIO")
	@GeneratedValue(generator="GENERADOR_IDROLUSUARIO",strategy=GenerationType.SEQUENCE)
	private Integer id_rol;
	@Column(name="nombre",nullable=false,unique=true)
	private String nombre;
	@Column(name="estatus",nullable=false)
	private Character estatus;
	private static final long serialVersionUID = 1L;

	public RolUsuario() {
		super();
	}   
	public Integer getId_rol() {
		return this.id_rol;
	}

	public void setId_rol(Integer id_rol) {
		this.id_rol = id_rol;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Character getEstatus() {
		return estatus;
	}
	public void setEstatus(Character estatus) {
		this.estatus = estatus;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((estatus == null) ? 0 : estatus.hashCode());
		result = prime * result + ((id_rol == null) ? 0 : id_rol.hashCode());
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
		RolUsuario other = (RolUsuario) obj;
		if (estatus == null) {
			if (other.estatus != null)
				return false;
		} else if (!estatus.equals(other.estatus))
			return false;
		if (id_rol == null) {
			if (other.id_rol != null)
				return false;
		} else if (!id_rol.equals(other.id_rol))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}  
}
