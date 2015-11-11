package kr.co.pms.dao;

import java.sql.SQLException;

import kr.co.pms.conf.*;
import kr.co.pms.mapper.UserMapper;
import kr.co.pms.model.LoginInfo;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserInfo2;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public UserInfo2 getUser(int uidx) throws SQLException{
		UserInfo2 userInfo2;
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if(userMapper!=null){
			userInfo2 = userMapper.getUser(uidx);
			if(userInfo2 == null){
				userInfo2 = new UserInfo2();
				userInfo2.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				userInfo2.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return userInfo2;
			} else {
				userInfo2.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				userInfo2.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return userInfo2;
			}
		} else {
			userInfo2 = new UserInfo2();
			userInfo2.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			userInfo2.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return userInfo2;
		}
		
	}
	public boolean createAccount(UserInfo2 userInfo2) {
		
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if(userMapper!=null){
			try{
				userMapper.createAccount(userInfo2);
				sqlSession.commit();
				return true;
			}catch(Exception e){
				return false;
			}
		}
		return false;
	}
	public int getSequence(){
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		if(userMapper!=null){
			try{
				int seq = userMapper.getSequence();
				return seq;
			}catch(Exception e){
				return -999;
			}
		}
		return -999;
	}
}
