package com.demo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.demo.DemoException;
import com.demo.action.Action;
import com.demo.action.ActionFactory;

public class DemoServlet extends HttpServlet {

  /**
   * Default serial version UUID
   */
  private static final long serialVersionUID = 1L;

  private Log log = LogFactory.getLog(DemoServlet.class);

  /**
   * Constructor of the object.
   */
  public DemoServlet() {
    super();
  }

  /**
   * Destruction of the servlet. <br>
   */
  public void destroy() {
    super.destroy(); // Just puts "destroy" string in log
    // Put your code here
  }

  /**
   * The doGet method of the servlet. <br>
   * 
   * This method is called when a form has its tag value method equals to get.
   * 
   * @param request
   *          the request send by the client to the server
   * @param response
   *          the response send by the server to the client
   * @throws ServletException
   *           if an error occurred
   * @throws IOException
   *           if an error occurred
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }

  /**
   * The doPost method of the servlet. <br>
   * 
   * This method is called when a form has its tag value method equals to post.
   * 
   * @param request
   *          the request send by the client to the server
   * @param response
   *          the response send by the server to the client
   * @throws ServletException
   *           if an error occurred
   * @throws IOException
   *           if an error occurred
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String actionName = request.getParameter("action");
    if (actionName == null) {
      actionName = "ForwardAction";
    }

    try {
      Action action = ActionFactory.createAction(actionName, getServletContext());
      action.beforeAction(request, response);
      int result = action.doAction(request, response);
      action.afterAction(result, request, response);
    } catch (DemoException e) {
      log.error("Sorry exception occured : ", e);
      request.setAttribute("error", e);
      request.getRequestDispatcher("WEB-INF/jsp/error.jsp").forward(request, response);
    }
  }

  /**
   * Initialization of the servlet. <br>
   * 
   * @throws ServletException
   *           if an error occurs
   */
  public void init() throws ServletException {
    // Put your code here
  }

}
