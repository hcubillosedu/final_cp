package com.cubillos.model.database;

import javax.persistence.*;

@Entity
@Table(name = "employee")
public class EmployeeModel {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_employee")
	private int idEmployee;
	
	@Column(name="id_user_database")
	private int idUserDatabase;
	
	@Column(name="full_name")
	private String fullName;
	
	@Column
	private int age;
	
	@Column
	private String birthday;
	
	@Column
	private String position;
	
	@Column
	private String telephone;
	
	@Column(name="telephone_2", nullable=true)
	private String telephone2;
	
	@Column
	private String address;

	@Column(name="full_name_contact")
	private String fullNameContact;
	
	@Column(name="telephone_contact")
	private String telephoneContact;
	
	@Column(name="created_at", insertable=false, updatable=false)
	private String createdAt;
	
	@Column
	private int state;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_user_database", insertable=false, updatable=false)
    private UserDatabaseModel userDatabase;
	
	public EmployeeModel() {
		
	}
	
	public EmployeeModel(int idUserDatabase, String fullName, int age, String birthday, String position, String telephone, String telephone2, String address, String fullNameContact, String telephoneContact, String createdAt, int state) {
		this.idUserDatabase = idUserDatabase;
		this.fullName = fullName;
		this.age = age;
		this.birthday = birthday;
		this.position = position;
		this.telephone = telephone;
		this.telephone2 = telephone2;
		this.address = address;
		this.fullNameContact = fullNameContact;
		this.telephoneContact = telephoneContact;
		this.createdAt = createdAt;
		this.state = state;
	}
	
	public int getIdEmployee() {
		return idEmployee;
	}
	
	public void setIdEmployee(int idEmployee) {
		this.idEmployee = idEmployee;
	}
	
	public int getIdUserDatabase() {
		return idUserDatabase;
	}
	
	public void setIdUserDatabase(int idUserDatabase) {
		this.idUserDatabase = idUserDatabase;
	}
	
	public String getFullName() {
		return fullName;
	}
	
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getBirthday() {
		return birthday;
	}
	
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getTelephone() {
		return telephone;
	}
	
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	public String getTelephone2() {
		return telephone2;
	}
	
	public void setTelephone2(String telephone2) {
		this.telephone2 = telephone2;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getFullNameContact() {
		return fullNameContact;
	}
	
	public void setFullNameContact(String fullNameContact) {
		this.fullNameContact = fullNameContact;
	}
	
	public String getTelephoneContact() {
		return telephoneContact;
	}
	
	public void setTelephoneContact(String telephoneContact) {
		this.telephoneContact = telephoneContact;
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
	
	public UserDatabaseModel getUserDatabase() {
		return userDatabase;
	}
	
	public void setUserDatabase(UserDatabaseModel userDatabase) {
		this.userDatabase = userDatabase;
	}
}
