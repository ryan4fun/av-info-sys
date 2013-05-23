package dao;

import java.util.Date;

import junit.framework.TestCase;

import org.junit.Test;

import com.demo.DemoException;
import com.demo.bo.User;
import com.demo.dao.DAOFactory;
import com.demo.dao.UserDAO;

public class UserDaoTestCase extends TestCase {

  public static final String _userDAOName = "UserDAO";

  @Test
  public void testCreateUser() {

    try {

      UserDAO userDao = (UserDAO) DAOFactory.getDAO(_userDAOName);

      assertNotNull(userDao);

      User user = new User();
      user.setName("test1");
      user.setLevel(1);
      user.setSex("male");
      user.setNickname("fuckYou");
      user.setPassword("123456");
      user.setCreated_date(new Date());

      userDao.save(user);

      assertTrue(user.getId() > 0);

    } catch (DemoException e) {

      throw new RuntimeException(e);
    }

  }

}
