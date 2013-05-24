package com.demo.bo;

import java.util.Date;

import com.demo.util.json.JSONException;
import com.demo.util.json.JSONObject;
import com.demo.util.json.JSONObject.JSONObjectable;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements JSONObjectable {

  // Constructors

  /** default constructor */
  public User() {
  }

  /** minimal constructor */
  public User(int id, String name, String password, String sex, String nickname) {

    super(id, name, password, sex, nickname);

  }

  /** full constructor */
  public User(int id, String name, String password, String email, short role, 
      String nickname, Date Register_date) {

    super(id, name, password, email, role,  nickname, Register_date);
  }

  public Object toJSONObject() throws JSONException {
    JSONObject o = new JSONObject();

    o.put("id", this.getId());
    o.put("username", this.getUsername());
    o.put("nickname", this.getNickname());
    o.put("role", this.getRole());
    o.put("email", this.getEmail());
    o.put("register_date", this.getRegister_date());

    return o;
  }

  public static User parse(JSONObject o) {

    User user = new User();

    try {

      user.setId(o.getInt("id"));
      user.setUsername(o.getString("username"));
      user.setPassword(o.getString("password"));
      user.setRole((short) o.getInt("role"));
      user.setEmail(o.getString("email"));
      user.setNickname(o.getString("nickname"));
      user.setRegister_date((Date) o.get("register_date"));

    } catch (JSONException e) {

      e.printStackTrace();
    }

    return user;

  }

}
