package dao;

import java.sql.SQLException;

import mapper.UserMapper;
import model.LoginInfo;
import model.UserInfo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import conf.*;

@Repository
public class UserDao implements Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserInfo login(LoginInfo loginInfo) throws SQLException{
		UserInfo userInfo;
		
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if(userMapper!=null){
			userInfo = userMapper.getData(loginInfo);
			if(userInfo == null){
				userInfo = new UserInfo();
				userInfo.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				userInfo.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return userInfo;
			} else {
				userInfo.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				userInfo.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return userInfo;
			}
		} else {
			userInfo = new UserInfo();
			userInfo.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			userInfo.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return userInfo;
		}
		
	}
	public UserInfo getUser(int uidx) throws SQLException{
		UserInfo userInfo;
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if(userMapper!=null){
			userInfo = userMapper.getUser(uidx);
			if(userInfo == null){
				userInfo = new UserInfo();
				userInfo.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				userInfo.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return userInfo;
			} else {
				userInfo.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				userInfo.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return userInfo;
			}
		} else {
			userInfo = new UserInfo();
			userInfo.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			userInfo.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return userInfo;
		}
		
	}
	public boolean createAccount(UserInfo userInfo) {
		
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if(userMapper!=null){
			try{
				userMapper.createAccount(userInfo);
				sqlSession.commit();
				return true;
			}catch(Exception e){
				return false;
			}
		}
		return false;
	}
}
