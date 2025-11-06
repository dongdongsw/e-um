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
	
	/*
	<select id="usersIdCheck" resultType="int" parameterType="string">
	  SELECT COUNT(*)
	  FROM users
	  WHERE u_id=#{u_id}
	</select>
	 */
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
	
	/*
	<insert id="usersInsert" parameterType="UsersVO">
	  INSERT INTO users 
	  (u_id, u_loginid, u_pwd, u_nickname, u_email, u_phone, u_gender, u_loc,
	   u_push_noti, u_email_noti, u_sms_noti, u_status, u_role)
	  VALUES 
	  (TO_CHAR(u_id_seq.NEXTVAL), #{u_loginid}, #{u_pwd}, #{u_nickname}, #{u_email}, #{u_phone}, #{u_gender}, 
	  #{u_loc}, #{u_push_noti}, #{u_email_noti}, #{u_sms_noti}, 'active', 'ROLE_USER')
	</insert>
	 */
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
