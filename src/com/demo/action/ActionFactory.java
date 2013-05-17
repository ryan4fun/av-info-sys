package com.demo.action;

import javax.servlet.ServletContext;

import com.demo.DemoException;

/**
 * Action factory creates every action from client request with specific action name.
 * 
 * 
 * 
 */
public class ActionFactory {
  private static String packagePrefix;
  /** Prepare current package's name */
  static {
    String tmp = ActionFactory.class.getName();
    int p = tmp.lastIndexOf(".");
    packagePrefix = tmp.substring(0, p + 1);
  }

  /**
   * Create an <code>Action</code> with specified action name and environment.
   * 
   * @param actionName
   * @return <code>Action</code> instance
   * @throws ClassNotFoundException
   */
  public static Action createAction(String actionName, ServletContext ctx) throws DemoException {

    String className = packagePrefix + actionName;
    if (actionName.startsWith("com.iact.action")) {
      className = actionName;
    }
    Class o = null;
    try {
      o = Class.forName(className);
    } catch (ClassNotFoundException e) {
      throw new DemoException(e);
    }

    Action action = null;
    try {
      action = (Action) o.newInstance();
      action.init(actionName, ctx);
    } catch (Exception e) {
      throw new DemoException(e);
    }

    return action;
  }
}
