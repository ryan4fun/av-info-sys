package com.demo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.demo.DemoException;
import com.demo.util.json.JSONException;
import com.demo.util.json.JSONObject;

public abstract class AbstractAction implements Action {

  protected static final Log log = LogFactory.getLog(AbstractAction.class);

  private String actionName = null;

  protected Map<String, Object> reqParams = null;

  protected ServletContext context;

  /** Action start time **/
  protected long start;

  /** Action end time **/
  protected long end;

  /*
   * (non-Javadoc)
   * 
   * @see com.ehr.action.Action#afterAction(int, javax.servlet.ServletRequest,
   * javax.servlet.ServletResponse)
   */
  public void afterAction(int error, HttpServletRequest req, HttpServletResponse res) {
    end = System.currentTimeMillis();
    if (log.isDebugEnabled()) {
      long cost = end - start;
      StringBuilder buf = new StringBuilder("A-");
      buf.append(Integer.toHexString(error)).append("-");
      buf.append(actionName);
      buf.append(" session=").append(getHttpSessionID(req));
      buf.append(" cost=").append(cost);
      buf.append("\n  params=").append(reqParams);
      log.debug(buf.toString());
    }
  }

  /*
   * (non-Javadoc)
   * 
   * @see com.ehr.action.Action#beforeAction(javax.servlet.ServletRequest,
   * javax.servlet.ServletResponse)
   */
  public void beforeAction(HttpServletRequest req, HttpServletResponse res) {
    start = System.currentTimeMillis();
    prepareRequestParameters(req);

    // Log debug info
    if (log.isDebugEnabled()) {
      StringBuilder buf = new StringBuilder("B-0-");
      buf.append(actionName);
      buf.append(" session=").append(getHttpSessionID(req));
      buf.append("\n  params=").append(reqParams);
      log.debug(buf.toString());
    }
  }

  /*
   * (non-Javadoc)
   * 
   * @see com.ehr.action.Action#doAction(javax.servlet.ServletRequest,
   * javax.servlet.ServletResponse)
   */
  public int doAction(HttpServletRequest req, HttpServletResponse res) throws DemoException {
    return _doAction(req, res);
  }

  protected void _forward(HttpServletRequest req, HttpServletResponse res) throws DemoException {
    String forward = (String) reqParams.get("page");
    if (forward == null) {
      if (forward == null) {
        throw new DemoException("Not specified web page");
      }
    }
    try {
      req.getRequestDispatcher("WEB-INF/jsp/" + forward).forward(req, res);
    } catch (ServletException e) {
      throw new DemoException(e);
    } catch (IOException e) {
      throw new DemoException(e);
    }
  }

  /*
   * (non-Javadoc)
   * 
   * @see com.ehr.action.Action#init(java.lang.String, javax.servlet.ServletContext)
   */
  public void init(String actionName, ServletContext context) {
    this.actionName = actionName;
    this.context = context;
    this.reqParams = new HashMap<String, Object>();
  }

  /**
   * Action executor.
   * 
   * @param req
   * @param res
   * @return
   */
  protected abstract int _doAction(HttpServletRequest req, HttpServletResponse res)
      throws DemoException;

  /**
   * Getter of action name.
   * 
   * @return
   */
  public String getActionName() {
    return actionName;
  }

  /**
   * Extract parameter info from request.
   * 
   * @param req
   */
  private void prepareRequestParameters(HttpServletRequest req) {
    Enumeration names = req.getParameterNames();
    while (names != null && names.hasMoreElements()) {
      String name = (String) names.nextElement();
      String[] values = req.getParameterValues(name);
      if (values.length > 1) {
        reqParams.put(name, values);
      } else {
        reqParams.put(name, values[0]);
      }
    }

    names = req.getAttributeNames();
    while (names != null && names.hasMoreElements()) {
      String name = (String) names.nextElement();
      Object value = req.getAttribute(name);
      if (value instanceof java.io.Serializable) {
        // All maybe NotSerializable object should be filtered
        if (value instanceof String[]) {
          String[] _values = (String[]) value;
          if (_values.length == 1) {
            value = _values[0];
          }
        }
        reqParams.put(name, value);
      }
    }
    reqParams.remove("action");
  }

  /**
   * Return http session id
   * 
   * @param req
   * @return
   */
  public String getHttpSessionID(HttpServletRequest req) {
    return ((HttpServletRequest) req).getSession().getId();
  }

  /**
   * Write message to
   * 
   * @param errorCode
   * @param msg
   * @param resp
   */
  protected void writeErrorMessage(int errorCode, String msg, HttpServletResponse resp)
      throws DemoException {
    try {
      resp.setContentType("text/html;charset=gb2312");
      PrintWriter pw = resp.getWriter();

      JSONObject jo = new JSONObject();
      jo.put("errorCode", errorCode);
      jo.put("errorMsg", msg);
      pw.write(jo.toString());
      pw.flush();
      pw.close();
    } catch (IOException e) {
      throw new DemoException(e);
    } catch (JSONException e) {
      throw new DemoException(e);
    }
  }
  
  /**
   * Write message to
   * 
   * @param errorCode
   * @param msg
   * @param resp
   */
  protected void writeErrorMessageString(String msg, HttpServletResponse resp)
      throws DemoException {
    try {
      resp.setContentType("text/html;charset=gb2312");
      PrintWriter pw = resp.getWriter();
      pw.write(msg);
      pw.flush();
      pw.close(); 
    } catch (IOException e) {
      throw new DemoException(e);
    }
  }  

  /**
   * Write result to response.
   * 
   * @param result
   * @param resp
   */
  protected void writeResponse(String result, HttpServletResponse resp) throws DemoException {
    try {
      resp.setContentType("text/html;charset=gb2312");
      PrintWriter pw = resp.getWriter();

      pw.write(result);
      pw.flush();
      pw.close();
    } catch (IOException e) {
      throw new DemoException(e);
    }
  }

  /**
   * Retrieve the SessionContainer for the user tier to the request.
   */
  protected SessionContainer getSessionContainer(HttpServletRequest request) {

    SessionContainer sessionContainer = (SessionContainer) getSessionObject(request,
        "sessionContainer");

    // Create a SessionContainer for the user if it doesn't exist already
    if (sessionContainer == null) {
      sessionContainer = new SessionContainer();
      sessionContainer.setLocale(request.getLocale());
      HttpSession session = request.getSession(true);
      session.setAttribute("sessionContainer", sessionContainer);
    }
    return sessionContainer;
  }

  /**
   * Retrieve a session object based on the request and the attribute name.
   */
  protected Object getSessionObject(HttpServletRequest req, String attrName) {
    Object sessionObj = null;
    HttpSession session = req.getSession(false);
    if (session != null) {
      sessionObj = session.getAttribute(attrName);
    }
    return sessionObj;
  }
}
