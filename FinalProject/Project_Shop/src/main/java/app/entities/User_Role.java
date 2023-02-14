package app.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users_roles")
public class User_Role {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "userId",referencedColumnName = "userId")
	private Users user;
	@ManyToOne
	@JoinColumn(name = "roleId",referencedColumnName = "roleId")
	private Role role;
	
	@Column(name = "status")
	private Boolean status;
	
	public User_Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User_Role(Long id, Users user, Role role, boolean status) {
		super();
		this.id = id;
		this.user = user;
		this.role = role;
		this.status = status;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
}
