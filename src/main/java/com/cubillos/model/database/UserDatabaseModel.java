package com.cubillos.model.database;

import javax.persistence.*;

import com.cubillos.model.UserModel;

@Entity
@Table(name = "user_database")
public class UserDatabaseModel {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_user_database")
	private int idUserDatabase;
	
	@Column(name="id_user")
	private int idUser;
	
	@Column(name="database_name")
	private String databaseName;
	
	@Column
	private String description;
	
	@Column(name="created_at", insertable=false, updatable=false)
	private String createdAt;
	
	@Column
	private int state;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_user", insertable=false, updatable=false)
    private UserModel users;
	
	public UserDatabaseModel() {
		
	}
	
	public UserDatabaseModel(int idUser, String databaseName, String description, int state) {
		this.idUser = idUser;
		this.databaseName = databaseName;
		this.description = description;
		this.state = state;
	}
	
	public int getIdUserDatabase() {
		return idUserDatabase;
	}
	
	public int getIdUser() {
		return idUser;
	}
	
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	public String getDatabaseName() {
		return databaseName;
	}
	
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public UserModel getUser() {
		return users;
	}
	
	public void setUser(UserModel userModel) {
		this.users = userModel;
	}
	
}
