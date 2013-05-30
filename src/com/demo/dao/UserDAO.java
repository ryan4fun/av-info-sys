package com.demo.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.demo.bo.User;

public class UserDAO extends BaseHibernateDAO {
  private static final Log log = LogFactory.getLog(UserDAO.class);
  // property constants
  public static final String USERNAME = "username";
  public static final String NICKNAME = "nickname";
  public static final String EMAIL = "email";
  public static final String ROLE = "role";
  public static final String REGISTER_DATE = "register_date";

  public void save(User transientInstance) {
    log.debug("saving User instance");
    try {
      getSession().save(transientInstance);
      log.debug("save successful");
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  public void delete(User persistentInstance) {
    log.debug("deleting User instance");
    try {
      getSession().delete(persistentInstance);
      log.debug("delete successful");
    } catch (RuntimeException re) {
      log.error("delete failed", re);
      throw re;
    }
  }

  public User findById(int id) {
    log.debug("getting User instance with id: " + id);
    try {
      User instance = (User) getSession().get("com.demo.bo.User", id);
      return instance;
    } catch (RuntimeException re) {
      log.error("get failed", re);
      throw re;
    }
  }

  public List findByExample(User instance) {
    log.debug("finding User instance by example");
    try {
      List results = getSession().createCriteria("com.demo.bo.User").add(Example.create(instance))
          .list();
      log.debug("find by example successful, result size: " + results.size());
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findByProperty(String propertyName, Object value) {
    log.debug("finding User instance with property: " + propertyName + ", value: " + value);
    try {
      String queryString = "from User as model where model." + propertyName + "= ?";
      Query queryObject = getSession().createQuery(queryString);
      queryObject.setParameter(0, value);
      return queryObject.list();
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }

  public List findByName(String name) {
    return findByProperty(USERNAME, name);
  }

  public List findByNickname(String nickname) {
    return findByProperty(NICKNAME, nickname);
  }

  public List findBySex(String email) {
    return findByProperty(EMAIL, email);
  }

  public List findByLevel(int role) {
    return findByProperty(ROLE, role);
  }

  public List findAll() {
    log.debug("finding all User instances");
    try {
      String queryString = "from User";
      Query queryObject = getSession().createQuery(queryString);
      return queryObject.list();
    } catch (RuntimeException re) {
      log.error("find all failed", re);
      throw re;
    }
  }

  public User merge(User detachedInstance) {
    log.debug("merging User instance");
    try {
      User result = (User) getSession().merge(detachedInstance);
      log.debug("merge successful");
      return result;
    } catch (RuntimeException re) {
      log.error("merge failed", re);
      throw re;
    }
  }

  public void attachDirty(User instance) {
    log.debug("attaching dirty User instance");
    try {
      getSession().saveOrUpdate(instance);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public void attachClean(User instance) {
    log.debug("attaching clean User instance");
    try {
      getSession().lock(instance, LockMode.NONE);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }
}