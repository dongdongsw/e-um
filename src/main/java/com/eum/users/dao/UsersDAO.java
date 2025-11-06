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
}
