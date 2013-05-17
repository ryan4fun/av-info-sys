package com.demo.bo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public abstract class AbstractUser implements java.io.Serializable {

  // Fields

  private Long id;
  private Long area;
  private String login;
  private String pwd;
  private String pwdquestion;
  private String pwdanswer;
  private String phoneNumber;
  private Integer phoneVerify;
  private String verifyCode;
  private String email;
  private String realName;
  private String sex;
  private String description;
  private Integer userType;
  private Double balance;
  private Integer level;
  private Integer credit;
  private Timestamp createDate;
  private Integer createMode;
  private Timestamp loginTime;
  private String loginIp;
  private Integer status;
  private Set payonlinelogs = new HashSet(0);

  // Constructors

  /** default constructor */
  public AbstractUser() {
  }

  /** minimal constructor */
  public AbstractUser(Long id, String login, String pwd, Integer phoneVerify, Integer userType,
      Double balance, Integer level, Integer credit, Integer createMode, Integer status) {
    this.id = id;
    this.login = login;
    this.pwd = pwd;
    this.phoneVerify = phoneVerify;
    this.userType = userType;
    this.balance = balance;
    this.level = level;
    this.credit = credit;
    this.createMode = createMode;
    this.status = status;
  }

  /** full constructor */
  public AbstractUser(Long id, Long area, String login, String pwd, String pwdquestion,
      String pwdanswer, String phoneNumber, Integer phoneVerify, String verifyCode, String email,
      String realName, String sex, String description, Integer userType, Double balance,
      Integer level, Integer credit, Timestamp createDate, Integer createMode, Timestamp loginTime,
      String loginIp, Integer status, Set payonlinelogs) {
    this.id = id;
    this.area = area;
    this.login = login;
    this.pwd = pwd;
    this.pwdquestion = pwdquestion;
    this.pwdanswer = pwdanswer;
    this.phoneNumber = phoneNumber;
    this.phoneVerify = phoneVerify;
    this.verifyCode = verifyCode;
    this.email = email;
    this.realName = realName;
    this.sex = sex;
    this.description = description;
    this.userType = userType;
    this.balance = balance;
    this.level = level;
    this.credit = credit;
    this.createDate = createDate;
    this.createMode = createMode;
    this.loginTime = loginTime;
    this.loginIp = loginIp;
    this.status = status;
    this.payonlinelogs = payonlinelogs;
  }

  // Property accessors

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getArea() {
    return this.area;
  }

  public void setArea(Long area) {
    this.area = area;
  }

  public String getLogin() {
    return this.login;
  }

  public void setLogin(String login) {
    this.login = login;
  }

  public String getPwd() {
    return this.pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public String getPwdquestion() {
    return this.pwdquestion;
  }

  public void setPwdquestion(String pwdquestion) {
    this.pwdquestion = pwdquestion;
  }

  public String getPwdanswer() {
    return this.pwdanswer;
  }

  public void setPwdanswer(String pwdanswer) {
    this.pwdanswer = pwdanswer;
  }

  public String getPhoneNumber() {
    return this.phoneNumber;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  public Integer getPhoneVerify() {
    return this.phoneVerify;
  }

  public void setPhoneVerify(Integer phoneVerify) {
    this.phoneVerify = phoneVerify;
  }

  public String getVerifyCode() {
    return this.verifyCode;
  }

  public void setVerifyCode(String verifyCode) {
    this.verifyCode = verifyCode;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getRealName() {
    return this.realName;
  }

  public void setRealName(String realName) {
    this.realName = realName;
  }

  public String getSex() {
    return this.sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public String getDescription() {
    return this.description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Integer getUserType() {
    return this.userType;
  }

  public void setUserType(Integer userType) {
    this.userType = userType;
  }

  public Double getBalance() {
    return this.balance;
  }

  public void setBalance(Double balance) {
    this.balance = balance;
  }

  public Integer getLevel() {
    return this.level;
  }

  public void setLevel(Integer level) {
    this.level = level;
  }

  public Integer getCredit() {
    return this.credit;
  }

  public void setCredit(Integer credit) {
    this.credit = credit;
  }

  public Timestamp getCreateDate() {
    return this.createDate;
  }

  public void setCreateDate(Timestamp createDate) {
    this.createDate = createDate;
  }

  public Integer getCreateMode() {
    return this.createMode;
  }

  public void setCreateMode(Integer createMode) {
    this.createMode = createMode;
  }

  public Timestamp getLoginTime() {
    return this.loginTime;
  }

  public void setLoginTime(Timestamp loginTime) {
    this.loginTime = loginTime;
  }

  public String getLoginIp() {
    return this.loginIp;
  }

  public void setLoginIp(String loginIp) {
    this.loginIp = loginIp;
  }

  public Integer getStatus() {
    return this.status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public Set getPayonlinelogs() {
    return this.payonlinelogs;
  }

  public void setPayonlinelogs(Set payonlinelogs) {
    this.payonlinelogs = payonlinelogs;
  }

}