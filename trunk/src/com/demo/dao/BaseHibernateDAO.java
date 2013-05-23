package com.demo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

public class BaseHibernateDAO implements IBaseHibernateDAO {

  public Session getSession() {
    return HibernateSessionFactory.getSession();
  }

  /**
   * Begin
   */
  public void beginTransaction() {
    HibernateSessionFactory.beginTransaction();
  }

  /**
   * Commit
   */
  public void commitTransaction() {
    HibernateSessionFactory.commitTransaction();
  }

  /**
   * Close current session
   */
  public void closeSession() {
    HibernateSessionFactory.closeSession();
  }

  /**
   * Rollback
   */
  public void rollbackTransaction() {
    HibernateSessionFactory.rollbackTransaction();
  }

  /**
   * Find collection of objects by primitive SQL query.
   * 
   * @param sql
   * @return
   */
  public List findByHSQL(String hsql, int start, int limit) {
    Query q = getSession().createQuery(hsql);
    q.setFirstResult(start);
    q.setMaxResults(limit);

    List l = q.list();
    return l;
  }

  /**
   * Find by range and order by.
   * 
   * @param start
   * @param limit
   * @param orderBys
   * @param orders
   * @return
   */
  public List find(int start, int limit, List<String> orderBys, List<String> orders) {
    Criteria c = getSession().createCriteria(this.getClass());
    int size = orderBys.size();
    for (int i = 0; i < size; i++) {
      String order = orders.get(i);
      String orderBy = orderBys.get(i);
      if (order.equalsIgnoreCase("desc")) {
        c.addOrder(Order.desc(orderBy));
      } else {
        c.addOrder(Order.asc(orderBy));
      }
    }

    return c.list();
  }
}