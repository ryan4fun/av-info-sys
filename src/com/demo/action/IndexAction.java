package com.demo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.DemoException;

public class IndexAction extends AbstractAction {

	@Override
	protected int _doAction(HttpServletRequest req, HttpServletResponse res)
			throws DemoException {
		// TODO Auto-generated method stub
		try{
			req.getRequestDispatcher("WEB-INF/jsp/index.jsp").forward(req, res);
		}catch(Exception e){
			throw new DemoException(e);
		}
		return 0;
	}

}
