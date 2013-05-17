package com.demo;

/**
 * Base exception of web application.
 * 
 * 
 * 
 */
public class DemoException extends Exception {

  /**
	 * 
	 */
  private static final long serialVersionUID = 1L;

  public DemoException(Throwable t) {
    super(t);
  }

  public DemoException(String msg) {
    super(msg);
  }

}
