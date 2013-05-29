package com.demo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.DemoException;
import com.demo.ErrorCode;
import com.demo.util.json.JSONException;
import com.demo.util.json.JSONObject;

public class LogoutAction extends AbstractAction {

	@Override
	protected int _doAction(HttpServletRequest req, HttpServletResponse res)
			throws DemoException {
		getSessionContainer(req).setUser(null);
		JSONObject jo = new JSONObject();
		try {
			jo.put("errorCode", ErrorCode.OK);
		} catch (JSONException e) {
			throw new DemoException(e);
		}
		writeResponse(jo.toString(), res);
		
		res.setStatus(200);
		this.reqParams.put("page", "index.jsp");
		_forward(req, res);
		
		return 0;
	}
	
}
