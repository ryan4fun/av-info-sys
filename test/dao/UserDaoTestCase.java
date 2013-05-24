package dao;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

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
//      user.setPassword("123456");
      
      MessageDigest md = MessageDigest.getInstance("MD5");
      byte[] result = md.digest("123456".getBytes("utf-8"));
      
      String password = new String(result,"utf-8");
      user.setPassword(password);
      
      user.setCreated_date(new Date());

      userDao.save(user);

      assertTrue(user.getId() > 0);

    } catch (DemoException e) {

      throw new RuntimeException(e);
      
    } catch (NoSuchAlgorithmException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

  }
  
  @Test
  public void testQueryUser() {

    try {

      UserDAO userDao = (UserDAO) DAOFactory.getDAO(_userDAOName);

      assertNotNull(userDao);
      
      List xx = userDao.findAll();

      assertTrue(xx.size()> 0);

    } catch (DemoException e) {

      throw new RuntimeException(e);
    }

  }

}
