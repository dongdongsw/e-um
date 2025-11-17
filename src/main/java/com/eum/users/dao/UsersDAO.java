package com.eum.users.dao;

import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.*;
import com.eum.main.vo.*;
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
					vo.setCreateat(dbVO.getCreateat());
					vo.setU_profileimg_url(dbVO.getU_profileimg_url());
					vo.setU_push_noti(dbVO.getU_push_noti());
					vo.setU_email_noti(dbVO.getU_email_noti());
					vo.setU_sms_noti(dbVO.getU_sms_noti());
					
					// 셀러인지 체크
					int seller = session.selectOne("usersSellerCheck", dbVO.getU_id());
					int sid=0;
					if (seller == 1) {
						sid = session.selectOne("sellerGetSid", dbVO.getU_id());
						vo.setSid(sid);
						System.out.println(sid);
					}
						
				} else {
					vo.setMsg("NOPWD");
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	// 정보 수정 데이터
	public static UsersVO usersInfoUpdateData(String u_loginid) {
	    UsersVO vo = null;
	    try {
	        SqlSession session = ssf.openSession();
	        vo = session.selectOne("usersInfoData", u_loginid); 
	        session.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return vo;
	}
	
	// 정보수정
	public static void usersInfoUpdate(UsersVO vo) {
		try {
			SqlSession session = ssf.openSession(true);
			session.update("usersInfoUpdate_ok", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 프로필 이미지 업로드
	public static void profileImgUpload(UsersVO vo) {
		try {
			SqlSession session = ssf.openSession(true);
			session.update("profileImgUpload", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 아이디 찾기
	public static String findMyId(UsersVO vo) {
		String u_loginid = "";
		try {
			SqlSession session = ssf.openSession();
			u_loginid = session.selectOne("findMyId", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return u_loginid;
	}
	
	// 비밀번호 찾기_정보확인
	public static String findMyPwd(UsersVO vo) {
		String u_id = "";
		try {
			SqlSession session = ssf.openSession();
			u_id = session.selectOne("findMyPwd", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return u_id;
	}
	// 비밀번호 재설정
	public static void pwdChange(UsersVO vo) {
		try {
			SqlSession session = ssf.openSession(true);
			session.update("pwdChange", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 회원 탈퇴
	public static void users_delete(String u_id) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.delete("deleteChatMessage", u_id);
			session.delete("deleteBoardLike", u_id);
			session.delete("deleteFavorite", u_id);
			session.delete("deleteReviewImage", u_id);
			session.delete("deleteReview", u_id);
			session.delete("deleteBoardOption", u_id);
			session.delete("deleteBoardImage", u_id);
			session.delete("deleteBoard", u_id);
			session.delete("deleteChat", u_id);
			session.delete("deleteUsersSeller", u_id);
			session.delete("deleteUsers", u_id);
			session.commit();
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
			session.rollback();
		}
	}
}