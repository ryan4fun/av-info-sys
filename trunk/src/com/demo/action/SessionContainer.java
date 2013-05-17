package com.demo.action;

import java.util.Locale;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import com.demo.bo.User;

/**
 * 
 * Used to store information about a specific user. This class is used so that the information is
 * not scattered throughout the HttpSession. Only this object is stored in the session for the user.
 * This class implements the HttpSessionBindingListener interface so that it can be notified of
 * session timeout and perform the proper cleanup.
 * 
 * 
 * 
 */
public class SessionContainer implements HttpSessionBindingListener {

  /**
   * Current user in this session
   */
  private User user;

  /**
   * Locale
   */
  private Locale locale;

  /**
   * Default Constructor
   */
  public SessionContainer() {
    super();
    initialize();
  }

  /**
   * The container calls this method when it is being unbound from the session.
   */
  public void valueUnbound(HttpSessionBindingEvent event) {
    // Perform resource cleanup
    System.out.println("Being unbound...");
    cleanUp();
  }

  /**
   * Set the locale for the user.
   */
  public void setLocale(Locale aLocale) {
    locale = aLocale;
  }

  /**
   * Retrieve the locale for the user.
   */
  public Locale getLocale() {
    return locale;
  }

  /**
   * The container calls this method when it is being bound to the session.
   */
  public void valueBound(HttpSessionBindingEvent event) {
    // Don't need to do anything, but still have to implement the
    // interface method.
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  /**
   * Initialize all of the required resources
   */
  private void initialize() {

  }

  /**
   * Clean up any open resources. The shopping cart is left intact intentionally.
   */
  public void cleanUp() {
    setUser(null);
  }

}
