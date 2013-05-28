package com.demo.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.DemoException;
import com.demo.bo.User;
import com.demo.dao.DAOFactory;
import com.demo.dao.UserDAO;

public class RegisterAction extends AbstractAction {
	public static final String _userDAOName = "UserDAO";

	@Override
	protected int _doAction(HttpServletRequest req, HttpServletResponse res) throws DemoException {
		try {
			String username = (String) reqParams.get("username");
			String password = (String) reqParams.get("password");
			String nickname = (String) reqParams.get("nickname");
			String email = (String) reqParams.get("nickname");
			Date register_date = new Date();
			
			// 对password进行MD5编码
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] temp_password = md.digest(password.getBytes("utf-8"));
			password = new String(temp_password,"utf-8");
			
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setNickname(nickname);
			user.setRegister_date(register_date);
			user.setEmail(email);
			
			UserDAO userDao = (UserDAO) DAOFactory.getDAO(_userDAOName);
			
			userDao.save(user);
			
			getSessionContainer(req).setUser(user);
			req.getRequestDispatcher("WEB-INF/jsp/index.jsp").forward(req, res);
			return 0;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			throw new DemoException(e);
		} catch (ServletException e) {
			throw new DemoException(e);
		}
		return 0;
	}

}
