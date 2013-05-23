package com.demo.bo;

import java.util.Date;

public abstract class AbstractUser implements java.io.Serializable {

  // Fields

  private int id;
  private String name;
  private String password;
  private String sex;
  private int level;
  private int is_login;
  private String nickname;
  private Date created_date;

  // Constructors

  /** default constructor */
  public AbstractUser() {
  }

  /** minimal constructor */
  public AbstractUser(int id, String name, String password, String sex, String nickname) {
    this.id = id;
    this.name = name;
    this.password = password;
    this.sex = sex;

  }

  /** full constructor */
  public AbstractUser(int id, String name, String password, String sex, short level,
      short is_login, String nickname, Date created_date) {
    this.id = id;
    this.name = name;
    this.password = password;
    this.sex = sex;
    this.level = level;
    this.is_login = is_login;
    this.nickname = nickname;
    this.created_date = created_date;

  }

  // Property accessors

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public int getLevel() {
    return level;
  }

  public void setLevel(int level) {
    this.level = level;
  }

  public int getIs_login() {
    return is_login;
  }

  public void setIs_login(short isLogin) {
    is_login = isLogin;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public Date getCreated_date() {
    return created_date;
  }

  public void setCreated_date(Date createdDate) {
    created_date = createdDate;
  }

}