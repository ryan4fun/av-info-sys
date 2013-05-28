package com.demo.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.demo.DemoException;
import com.demo.bo.User;
import com.demo.dao.DAOFactory;
import com.demo.dao.UserDAO;

public class RegisterAction extends AbstractAction {
	public static final String _userDAOName = "UserDAO";

	@Override
	protected int _doAction(HttpServletRequest req, HttpServletResponse res)
			throws DemoException {
		String username = (String) reqParams.get("username");
		String password = (String) reqParams.get("password");
		String nickname = (String) reqParams.get("nickname");
		String email = (String) reqParams.get("email");
		Date register_date = new Date();

		// 对password进行MD5编码
		password = DigestUtils.md5Hex(password);

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setRegister_date(register_date);
		user.setEmail(email);

		UserDAO userDao = (UserDAO) DAOFactory.getDAO(_userDAOName);

		userDao.save(user);

		getSessionContainer(req).setUser(user);
		this.reqParams.put("page", "index.jsp");
		_forward(req, res);
		return 0;
	}

}
