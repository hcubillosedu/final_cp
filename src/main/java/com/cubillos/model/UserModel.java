package com.cubillos.model;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class UserModel {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_user")
	private int idUser;
	
	@Column(name = "email_user", nullable = false)
	private String emailUser;
	
	@Column(name = "name_user", nullable = false)
	private String nameUser;
	
	@Column(name = "last_name_user", nullable = true)
	private String lastNameUser;
	
	@Column(nullable = false)
	private String password;
		
	@Column(name = "enterprise_name", nullable = false)
	private String enterpriseName;
	
	@Column(nullable = false)
	private int state;
	
	@OneToOne(fetch = FetchType.LAZY,
            cascade =  CascadeType.ALL,
            mappedBy = "users")
    private UserRoleModel userRole;

	public int getIdUser() {
		return idUser;
	}
	
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}
	
	public String getLastNameUser() {
		return lastNameUser;
	}

	public void setLastNameUser(String lastNameUser) {
		this.lastNameUser = lastNameUser;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEnterpriseName() {
		return enterpriseName;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public UserRoleModel getUserRole() {
		return userRole;
	}
	
	public void setUserRole(UserRoleModel userRoleModel) {
		this.userRole = userRoleModel;
	}
	
	@Override
	public String toString() {
		return "UserModel{ id_user= "+idUser+", email_user= "+emailUser+", name_user= "+nameUser+", last_name_user= "+lastNameUser+", password= "+password+", enterprise_name= "+enterpriseName+", state= "+state+" }";
	} 
}
