package mapper;

import java.sql.SQLException;

import model.LoginInfo;
import model.UserInfo;

public interface UserMapper {
//	 public List<User> selectAllUsers();  
//	 public User selectUser(String username);  
	 public UserInfo getData(LoginInfo loginInfo) throws SQLException;
	 public UserInfo getUser(int uidx) throws SQLException;
	 public void createAccount(UserInfo userInfo);  
//	 public void updateUser(User user);  
//	 public void deleteUser(String username);
}
