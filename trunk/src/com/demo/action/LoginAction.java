/**  
 * @copyRight IAct Software Co.,Ltd.  
 * File: LoginAction.java
 * Created: 2012-7-9
 */
package com.demo.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.demo.DemoException;
import com.demo.ErrorCode;
import com.demo.bo.User;
import com.demo.dao.DAOFactory;
import com.demo.dao.UserDAO;
import com.demo.util.json.JSONException;
import com.demo.util.json.JSONObject;

/**
 * @author Andy
 * 
 */
public class LoginAction extends AbstractAction {

  private static final String DAO = "UserDAO";

  protected int _doAction(HttpServletRequest req, HttpServletResponse res) throws DemoException {

    String authCode = (String) req.getSession().getAttribute("authCode");
    String pAuthCode = (String) reqParams.get("authCode");
    String loginName = (String) reqParams.get("name");
    String password = (String) reqParams.get("password");

    if (!authCode.equalsIgnoreCase(pAuthCode)) {

      String errMsg = "验证码错误！";
      res.setStatus(403);
      getSessionContainer(req).setUser(null);
      writeErrorMessageString(errMsg, res);
     
      return 0;
    } else {

      String pMD5 = DigestUtils.md5Hex(password);
      // System.out.println("### only for debug : " + pMD5);

      UserDAO userDAO = (UserDAO) DAOFactory.getDAO(DAO);
      List<User> users = userDAO.findByName(loginName);
      if (users != null) {
        for (User user : users) {
          boolean matched = user.getPassword().equals(pMD5);
          if (matched) {
            getSessionContainer(req).setUser(user);
            JSONObject jo = new JSONObject();
            try {
              jo.put("errorCode", ErrorCode.OK);
            } catch (JSONException e) {
              throw new DemoException(e);
            }
            writeResponse(jo.toString(), res);
            return 0;
          }
        }
      }
    }

    String errMsg = "用户名或密码错误！";
    res.setStatus(403);
    getSessionContainer(req).setUser(null);
    writeErrorMessageString(errMsg, res);
    return 0;
  }

}
