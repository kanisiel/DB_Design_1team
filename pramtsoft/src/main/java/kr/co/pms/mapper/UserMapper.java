package kr.co.pms.mapper;

import java.sql.SQLException;
import java.util.List;

import kr.co.pms.model.*;

public interface UserMapper {
	 public UserInfo getData(LoginInfo loginInfo) throws SQLException;
	 public List<UserInfo> getUserList() throws SQLException;
	 public List<UserInfo> getLevelList(String levels) throws SQLException;
	 public List<UserInfo> getUserListP(Pagination pagination) throws SQLException;
	 public List<UserInfo> getRequest() throws SQLException;
	 public int getAllRownum() throws SQLException;
	 public void encryptSha512(UserInfo userInfo) throws SQLException;
	 public void approveRequest(int uidx) throws SQLException;
	 public void deleteRequest(int uidx) throws SQLException;
	 public void updateUpdate(int uidx) throws SQLException;
	 public UserInfo2 getUser(int uidx) throws SQLException;
	 public void createAccount(UserInfo userInfo) throws SQLException;
	 public int getSequence() throws SQLException;
	 public List<Department> getDepartmentList() throws SQLException;
	 public List<Section> getSectionList() throws SQLException;
}
