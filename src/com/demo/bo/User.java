package com.demo.bo;

import java.sql.Timestamp;
import java.util.Set;

import com.demo.util.json.JSONException;
import com.demo.util.json.JSONObject;
import com.demo.util.json.JSONObject.JSONObjectable;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable, JSONObjectable {

  // Constructors

  /** default constructor */
  public User() {
  }

  /** minimal constructor */
  public User(Long id, String login, String pwd, Integer phoneVerify, Integer userType,
      Double balance, Integer level, Integer credit, Integer createMode, Integer status) {
    super(id, login, pwd, phoneVerify, userType, balance, level, credit, createMode, status);
  }

  /** full constructor */
  public User(Long id, Long area, String login, String pwd, String pwdquestion, String pwdanswer,
      String phoneNumber, Integer phoneVerify, String verifyCode, String email, String realName,
      String sex, String description, Integer userType, Double balance, Integer level,
      Integer credit, Timestamp createDate, Integer createMode, Timestamp loginTime,
      String loginIp, Integer status, Set payonlinelogs) {
    super(id, area, login, pwd, pwdquestion, pwdanswer, phoneNumber, phoneVerify, verifyCode,
        email, realName, sex, description, userType, balance, level, credit, createDate,
        createMode, loginTime, loginIp, status, payonlinelogs);
  }

  public Object toJSONObject() throws JSONException {
    JSONObject o = new JSONObject();

    /**
     * 
     * Put properties
     */
    return o;
  }

  public static User parse(JSONObject o) {

    User user = new User();

    /**
     * set properties
     */
    return user;

  }

}
