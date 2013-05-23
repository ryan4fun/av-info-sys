/**  
 * @copyRight IAct Software Co.,Ltd.  
 * File: ErrorCode.java
 * Created: 2012-7-14
 */
package com.demo;

/**
 * @author Andy
 * 
 */
public class ErrorCode {

  /**
   * OK
   */
  public static final int OK = 200;

  /**
   * Auth code is wrong.
   */
  public static final int AUTH_CODE_FAILURE = 444;

  /**
   * Wrong password or user name.
   */
  public static final int AUTH_FAILURE = 403;

  /**
   * User name is existed
   */
  public static final int EXISTED_USER = 501;

}
