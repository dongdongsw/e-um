package com.eum.list.dao;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.ContentVO;

public class ContentDAO {
    private static SqlSessionFactory ssf;
    static {
        ssf = CreateSqlSessionFactory.getSsf();
    }

    public static List<ContentVO> contentListData(Map<String, Object> params) {
        List<ContentVO> list = null;
        try (SqlSession session = ssf.openSession()) {
            list = session.selectList("contentListData", params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int contentTotalPage() {
        int total = 0;
        try (SqlSession session = ssf.openSession()) {
            total = session.selectOne("contentTotalPage");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
    public static ContentVO contentDetailData(String b_id) {
		   SqlSession session=ssf.openSession();
		   ContentVO vo=session.selectOne("contentDetailData",b_id);
		   session.close();
		   return vo;
	   }
	   
	   public static List<String> contentDetailImage(String b_id) {
		   SqlSession session=ssf.openSession();
		   List<String> list=session.selectList("contentDetailImage",b_id);
		   session.close();
		   return list;
	   }
}
