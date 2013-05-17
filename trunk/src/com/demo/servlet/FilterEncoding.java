package com.demo.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterEncoding implements Filter {

  protected String encoding;
  protected boolean ignore;

  protected FilterConfig filterConfig;

  public void init(FilterConfig filterConfig) throws ServletException {

    encoding = filterConfig.getInitParameter("encoding");
    String value = filterConfig.getInitParameter("ignore");
    if (value == null) {
      ignore = true;
    } else if (value.equalsIgnoreCase("yes")) {
      ignore = true;
    } else if (value.equalsIgnoreCase("true")) {
      ignore = true;
    }

  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    if (ignore || request.getCharacterEncoding() == null) {
      String encoding = selectEncoding(request);
      if (encoding != null) {
        request.setCharacterEncoding(encoding);
      }
    }
    chain.doFilter(request, response);

  }

  private String selectEncoding(ServletRequest request) {

    return encoding;
  }

  public void destroy() {

  }

}
