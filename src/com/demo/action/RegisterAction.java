package com.demo.action;

import java.util.Date;
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

public class RegisterAction extends AbstractAction {
	public static final String _userDAOName = "UserDAO";

	@Override
	protected int _doAction(HttpServletRequest req, HttpServletResponse res)
			throws DemoException {
		String authCode = (String) req.getSession().getAttribute("authCode");
		String pAuthCode = (String) reqParams.get("authCode");
		String username = (String) reqParams.get("username");
		String password = (String) reqParams.get("password");
		String nickname = (String) reqParams.get("nickname");
		String email = (String) reqParams.get("email");
		Date register_date = new Date();

		if (!authCode.equalsIgnoreCase(pAuthCode)) {
			String errMsg = "验证码错误！";
			res.setStatus(403);
			getSessionContainer(req).setUser(null);
			writeErrorMessage(ErrorCode.AUTH_FAILURE, errMsg, res);

			return 0;
		}
		
		// 验证用户名唯一性
		UserDAO userDao = (UserDAO) DAOFactory.getDAO(_userDAOName);
		List<User> users = userDao.findByName(username);
		if(users.size() != 0){
			String errMsg = "用户名已被抢注了！";
			res.setStatus(403);
			getSessionContainer(req).setUser(null);
			writeErrorMessage(ErrorCode.AUTH_FAILURE, errMsg, res);
			return 0;
		}
		
		// 对password进行MD5编码
		password = DigestUtils.md5Hex(password);

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setRegister_date(register_date);
		user.setEmail(email);

		userDao.save(user);

		getSessionContainer(req).setUser(user);
		JSONObject jo = new JSONObject();
		try {
			jo.put("errorCode", ErrorCode.OK);
		} catch (JSONException e) {
			throw new DemoException(e);
		}
		writeResponse(jo.toString(), res);
		
		res.setStatus(201);
		this.reqParams.put("page", "index.jsp");
		_forward(req, res);
		return 0;
	}

}
