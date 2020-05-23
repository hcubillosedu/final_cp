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
	
	@OneToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(referencedColumnName = "email_user")
    private UserModel users;
	
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
