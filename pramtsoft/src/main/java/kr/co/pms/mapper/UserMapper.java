package kr.co.pms.mapper;

import java.sql.SQLException;

import kr.co.pms.model.LoginInfo;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserInfo2;

public interface UserMapper {
	 public UserInfo getData(LoginInfo loginInfo) throws SQLException;
	 public UserInfo getUser(int uidx) throws SQLException;
	 public void createAccount(UserInfo2 userInfo2) throws SQLException;
	 public int getSequence() throws SQLException;
}
