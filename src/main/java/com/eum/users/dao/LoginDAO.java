package com.eum.users.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.list.vo.*;
import com.eum.commons.*;

public class LoginDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	/*
	      <select id="usersIdCheck" resultType="int" parameterType="string">
		    SELECT COUNT(*)
		    FROM users
		    WHERE u_id=#{u_id}
		  </select>
		  
		  <select id="usersInfoData" resultType="UsersVO" parameterType="string">
		    SELECT u_id, u_loginid, u_pwd, u_nickname, u_phone, u_gender, u_loc, u_status, u_role
		    FROM users
		    WHERE u_id=#{u_id}
		  </select>
	 */
	public static int usersIdCheck(String u_id) {
		int count = 0;
		try {
			SqlSession session = ssf.openSession();
			count = session.selectOne("usersIdCheck", u_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	
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
