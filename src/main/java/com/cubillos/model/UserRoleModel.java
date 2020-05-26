package com.cubillos.model;

import javax.persistence.*;

@Entity
@Table(name = "user_role")
public class UserRoleModel {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_user_role")
	private int idUserRole;
	
	@Column(name="email_user")
	private String emailUser;
	
	@Column
	private String role;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "email_user", insertable=false, updatable=false)
    private UserModel users;
	
	public UserRoleModel() {
		
	}
	
	public UserRoleModel(String emailUser, String role) {
		this.emailUser = emailUser;
		this.role = role;
	}
	
	public int getIdUserRole() {
		return idUserRole;
	}
	
	public void setIdUserRole(int idUserRole) {
		this.idUserRole = idUserRole;
	}
	
	public String getEmailUser() {
		return emailUser;
	}
	
	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public UserModel getUser() {
		return users;
	}
	
	public void setUser(UserModel userModel) {
		this.users = userModel;
	}
	
}
