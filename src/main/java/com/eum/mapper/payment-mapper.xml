<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.eum.pay.mapper.payment-mapper">
  <resultMap type="BoardVO" id="optionMap">
    <result property="usvo.u_s_id" column="u_s_id"/>
    <result property="usvo.u_s_profileimg_url" column="u_s_profileimg_url"/>
    <result property="usvo.u_s_com" column="u_s_com"/>
    <result property="bovo.b_op_id" column="b_op_id"/>
    <result property="bovo.b_op_title" column="b_op_title"/>
    <result property="bovo.b_op_price" column="b_op_price"/>
    <result property="bovo.b_op_detail" column="b_op_detail"/>
  </resultMap>
  
  <select id="ordersData" resultMap="optionMap" parameterType="int">
    SELECT 
	b.b_id,
	b_thumbnail,
	us.u_s_id,
	u_s_profileimg_url,
	u_s_com,
	b_op_id,
	b_op_title,
	b_op_price,
	b_op_detail
	FROM board b, users_seller us, board_option bo
	WHERE b.u_s_id = us.u_s_id
	AND b.b_id = bo.b_id
	AND bo.b_op_id = #{b_op_id}
  </select>
</mapper>
