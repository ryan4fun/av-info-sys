package com.demo.bo;

import java.util.Date;

public abstract class AbstractUser implements java.io.Serializable {

  // Fields

  /**
   * 
   */
  private static final long serialVersionUID = 13344455222222L;
  private int id;
  private String username;
  private String password;
  private String email;
  private int role;
  private String nickname;
  private Date register_date;

  // Constructors

  /** default constructor */
  public AbstractUser() {
  }

  /** minimal constructor */
  public AbstractUser(int id, String username, String password, String email, String nickname) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.email = email;

  }

  /** full constructor */
  public AbstractUser(int id, String username, String password, String email, int role, 
      String nickname, Date register_date) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.email = email;
    this.role = role;
    this.nickname = nickname;
    this.register_date = register_date;

  }

  // Property accessors

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public int getRole() {
	return role;
}

public void setRole(int role) {
	this.role = role;
}

public String getNickname() {
	return nickname;
}

public void setNickname(String nickname) {
	this.nickname = nickname;
}

public Date getRegister_date() {
	return register_date;
}

public void setRegister_date(Date register_date) {
	this.register_date = register_date;
}


}