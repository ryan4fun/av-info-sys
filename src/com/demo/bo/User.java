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
  public User(int id, String name, String password, String sex, short level, short is_login,
      String nickname, Date created_date) {

    super(id, name, password, sex, level, is_login, nickname, created_date);
  }

  public Object toJSONObject() throws JSONException {
    JSONObject o = new JSONObject();

    o.put("id", this.getId());
    o.put("name", this.getName());
    o.put("nickname", this.getNickname());
    o.put("level", this.getLevel());
    o.put("sex", this.getSex());
    o.put("is_login", this.getIsLogin());
    o.put("created_date", this.getCreated_date());

    return o;
  }

  public static User parse(JSONObject o) {

    User user = new User();

    try {

      user.setId(o.getInt("id"));
      user.setName(o.getString("name"));
      user.setPassword(o.getString("password"));
      user.setLevel((short) o.getInt("level"));
      user.setSex(o.getString("sex"));
      user.setIsLogin((short) o.getInt("is_login"));
      user.setNickname(o.getString("nickname"));
      user.setCreated_date((Date) o.get("created_date"));

    } catch (JSONException e) {

      e.printStackTrace();
    }

    return user;

  }

}
