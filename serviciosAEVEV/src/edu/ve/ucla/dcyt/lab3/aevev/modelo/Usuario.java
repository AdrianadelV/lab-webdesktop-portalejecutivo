package edu.ve.ucla.dcyt.lab3.aevev.modelo;

import java.io.Serializable;
import java.lang.Integer;
import java.util.Date;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Usuario
 *
 */
@Entity
@Table(name="usuario",schema="public")
public class Usuario implements Serializable {

	   
	@Id
	@SequenceGenerator(schema="public",name="GENERADOR_IDUSUARIOS",allocationSize=1,sequenceName="IDUSUARIOS")
	@GeneratedValue(generator="GENERADOR_IDUSUARIOS",strategy=GenerationType.SEQUENCE)
	private Integer id_usuario;
	@Column(name="nombre_login",length=255,unique=true,nullable=false)
	private String nombre_login;
	@Column(name="nombre",length=255,nullable=false)
	private String nombre;
	@Column(name="cedula",length=10,nullable=false,unique=true)
	private String cedula;
	@Column(name="direccion",length=255,nullable=true)
	private String direccion;
	@Column(name="fecha_nacimiento",nullable=false)
	@Temporal(TemporalType.DATE)
	private Date fecha_nacimiento;
	@Column(name="sexo",nullable=false)
	private char sexo;
	@Column(name="contrasena",nullable=false)
	private String contrasena;
	@Column(name="email",unique=true,nullable=false)
	private String email;
	@Column(name="telefono")
	private String telefono;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "ciudad", nullable = false)
	private Ciudad ciudad;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "rolusuario", nullable = false)
	private RolUsuario rolusuario;
	
	
	private static final long serialVersionUID = 1L;

	public Usuario() {
		super();
	}   
	public Integer getId_usuario() {
		return this.id_usuario;
	}

	public void setId_usuario(Integer id_usuario) {
		this.id_usuario = id_usuario;
	}
	public String getNombre_login() {
		return nombre_login;
	}
	public void setNombre_login(String nombre_login) {
		this.nombre_login = nombre_login;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	public char getSexo() {
		return sexo;
	}
	public void setSexo(char sexo) {
		this.sexo = sexo;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public Ciudad getCiudad() {
		return ciudad;
	}
	public void setCiudad(Ciudad ciudad) {
		this.ciudad = ciudad;
	}
	
	public RolUsuario getRolusuario() {
		return rolusuario;
	}
	public void setRolusuario(RolUsuario rolusuario) {
		this.rolusuario = rolusuario;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cedula == null) ? 0 : cedula.hashCode());
		result = prime * result + ((ciudad == null) ? 0 : ciudad.hashCode());
		result = prime * result
				+ ((contrasena == null) ? 0 : contrasena.hashCode());
		result = prime * result
				+ ((direccion == null) ? 0 : direccion.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime
				* result
				+ ((fecha_nacimiento == null) ? 0 : fecha_nacimiento.hashCode());
		result = prime * result
				+ ((id_usuario == null) ? 0 : id_usuario.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		result = prime * result
				+ ((nombre_login == null) ? 0 : nombre_login.hashCode());
		result = prime * result
				+ ((rolusuario == null) ? 0 : rolusuario.hashCode());
		result = prime * result + sexo;
		result = prime * result
				+ ((telefono == null) ? 0 : telefono.hashCode());
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
		Usuario other = (Usuario) obj;
		if (cedula == null) {
			if (other.cedula != null)
				return false;
		} else if (!cedula.equals(other.cedula))
			return false;
		if (ciudad == null) {
			if (other.ciudad != null)
				return false;
		} else if (!ciudad.equals(other.ciudad))
			return false;
		if (contrasena == null) {
			if (other.contrasena != null)
				return false;
		} else if (!contrasena.equals(other.contrasena))
			return false;
		if (direccion == null) {
			if (other.direccion != null)
				return false;
		} else if (!direccion.equals(other.direccion))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (fecha_nacimiento == null) {
			if (other.fecha_nacimiento != null)
				return false;
		} else if (!fecha_nacimiento.equals(other.fecha_nacimiento))
			return false;
		if (id_usuario == null) {
			if (other.id_usuario != null)
				return false;
		} else if (!id_usuario.equals(other.id_usuario))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (nombre_login == null) {
			if (other.nombre_login != null)
				return false;
		} else if (!nombre_login.equals(other.nombre_login))
			return false;
		if (rolusuario == null) {
			if (other.rolusuario != null)
				return false;
		} else if (!rolusuario.equals(other.rolusuario))
			return false;
		if (sexo != other.sexo)
			return false;
		if (telefono == null) {
			if (other.telefono != null)
				return false;
		} else if (!telefono.equals(other.telefono))
			return false;
		return true;
	}	
}
