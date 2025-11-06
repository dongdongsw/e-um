package com.eum.users.dao;

import java.util.*;

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
	/*
	 * public static int usersIdCheck(String u_id) {
	 * 
	 * }
	 */
}
