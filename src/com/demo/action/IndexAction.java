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
			req.setAttribute("title", "你好啊！~！~！~！~！");
			req.setAttribute("user", getSessionObject(req, "user"));
			req.getRequestDispatcher("WEB-INF/jsp/index.jsp").forward(req, res);
			//this.setTitle("你好啊~~~");
			
		}catch(Exception e){
			throw new DemoException(e);
		}
		return 0;
	}
	
//	
//	protected String title;
//	
//	public String getTitle(){
//		return this.title;
//	}
//	public void setTitle(String title){
//		this.title=title;
//	}

}
