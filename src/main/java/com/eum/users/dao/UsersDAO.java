package com.eum.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.*;
import com.eum.users.vo.*;
public class UsersDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 아이디 중복 체크
	public static int usersIdCheck(String u_loginid) {
		int count=0;
		try {
			SqlSession session=ssf.openSession();
			count=session.selectOne("usersIdCheck",u_loginid);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	
	// 닉네임 중복 체크
	public static int usersNickCheck(String u_nickname) {
		int count=0;
		try {
			SqlSession session=ssf.openSession();
			count=session.selectOne("usersNickCheck",u_nickname);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	
	// 이메일 존재로 회원 여부 판단
	public static int usersEmailCheck(String u_email) {
		int count=0;
		try {
			SqlSession session=ssf.openSession();
			count=session.selectOne("usersEmailCheck",u_email);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	
	// 전화번호 존재로 회원 여부 판단
	public static int usersPhoneCheck(String u_phone) {
		int count=0;
		try {
			SqlSession session=ssf.openSession();
			count=session.selectOne("usersPhoneCheck",u_phone);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	
	// 회원가입
	public static void usersInsert(UsersVO vo) {
		try {
			SqlSession session=ssf.openSession(true);
			session.insert("usersInsert",vo);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 로그인
	public static UsersVO usersLogin(String u_id, String pwd) {
		UsersVO vo = new UsersVO();
		try {
			SqlSession session = ssf.openSession();
			int count = session.selectOne("usersIdCheck", u_id);
			if(count==0) {
				vo.setMsg("NOID");
			} else {
				UsersVO dbVO = session.selectOne("usersInfoData", u_id);
				if(pwd.equals(dbVO.getU_pwd())) {
					vo.setMsg("OK");
					vo.setU_id(dbVO.getU_id());
					vo.setU_loginid(dbVO.getU_loginid());
					vo.setU_nickname(dbVO.getU_nickname());
					vo.setU_gender(dbVO.getU_gender());
					vo.setU_loc(dbVO.getU_loc());
					vo.setU_status(dbVO.getU_status());
					vo.setU_email(dbVO.getU_email());
					vo.setU_role(dbVO.getU_role());
					vo.setU_phone(dbVO.getU_phone());
				} else {
					vo.setMsg("NOPWD");
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}

}
