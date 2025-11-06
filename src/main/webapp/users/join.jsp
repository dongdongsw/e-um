<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/join.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>

<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#idBtn').click(function(){
		Shadowbox.open({
			content:'../users/idcheck.eum',
			player:'iframe',
			width:420,
			height:290
		})
	})
	
	$('#nickBtn').click(function(){
		Shadowbox.open({
			content:'../users/nickcheck.eum',
			player:'iframe',
			width:420,
			height:290
		})
	})
	
	$('#joinBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()==="") {
			alert("아이디 중복체크를 하세요")
			return
		}	
		let pwd1=$('#pwd1').val()
		if(pwd1.trim()==="") {
			$('#pwd1').focus()
			return
		}
		let pwd2=$('#pwd2').val()
		if(pwd1!==pwd2) {
			alert("비밀번호가 틀립니다")
			$('#pwd2').val("")
			$('#pwd2').focus()
			return
		}
		let nickname=$('#nickname').val()
		if(nickname.trim()==="") {
			alert("닉네임을 입력하세요")
			$('#nickname').focus()
			return
		}
		
		let email=$('#email').val()
		if(email.trim()==="") {
			alert("이메일을 입력하세요")
			$('#email').focus()
			return
		}
		
		let birth=$('#birth').val()
		if(birth.trim()==="") {
			alert("생년월일을 선택하세요")
			$('#birth').focus()
			return
		}
		
		// Model로 전송
		$('#frm').submit()
	})
})
</script>
</head>
<body>
<div class="header-text" style="height: 150px;"></div>
  <div class="join-container">
    <div class="panel">
      <h1 class="title" style="color:black">회원가입하고<br/>비즈니스 성공을 시작해 보세요!</h1>
      <p class="subtitle">이미 계정이 있으신가요? <a href="#" style="color: #888;">로그인하기</a></p>
	  <div style="height: 30px"></div>
     <form id="frm" name="frm" method="post" action="../users/join_ok.eum">
        <!-- 아이디 (필수) -->
        <div class="field">
          <label class="label" for="u_loginId">아이디<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="id-inline">
            <div class="search">
              <input class="search_input" id="id" name="id" type="text" placeholder="아이디" readonly/>
            </div>
            <button type="button" id="idBtn" class="btn">중복체크</button>
          </div>
        </div>
        
        <!-- 비밀번호 (필수) -->
        <div class="field">
          <label class="label" for="u_pwd">비밀번호<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="pwd1" name="pwd" type="password" placeholder="비밀번호" />
          </div>
        </div>

        <!-- 비밀번호 확인 (필수) -->
        <div class="field">
          <label class="label" for="u_pwd_check">비밀번호 확인<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="pwd2" type="password" placeholder="비밀번호 재입력" />
          </div>
        </div>

        <!-- 닉네임 (필수) -->
        <div class="field">
          <label class="label" for="u_nickname">닉네임<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="id-inline">
            <div class="search">
              <input class="search_input" id="nickname" name="nickname" type="text" placeholder="닉네임" readonly/>
            </div>
            <button type="button" id="nickBtn" class="btn">중복체크</button>
          </div>
        </div>

        <!-- 이메일 (필수) -->
        <div class="field">
          <label class="label" for="u_email">이메일<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="email" name="email" type="email" placeholder="이메일" />
          </div>
        </div>

		<!-- 생년월일 (필수) -->
        <div class="field">
          <label class="label" for="u_birth">생년월일<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="birth" name="birth" type="date" />
          </div>
        </div>
        
        <!-- 휴대폰 -->
        <div class="field">
          <label class="label" for="u_phone">휴대폰 번호</label>
          <div class="search">
            <input class="search_input" id="phone" name="phone" type="text" placeholder="010XXXXXXXX" />
          </div>
        </div>


        <!-- 성별 -->
        <div class="field">
          <label class="label">성별</label>
          <div class="radio-wrap">
            <label><input type="radio" name="gender" value="남" checked /> 남성</label>
            <label><input type="radio" name="gender" value="여" /> 여성</label>
          </div>
        </div>



        <div class="field">
		  <label class="label">주소</label>
		  <div class="row">
		    <div class="col">
		      <div class="search">
		        <select id="provinceSelect" name="loc_do">
		          <option value="">도/광역시 선택</option>
		          <option value="서울특별시">서울특별시</option>
		          <option value="부산광역시">부산광역시</option>
		          <option value="대구광역시">대구광역시</option>
		          <option value="인천광역시">인천광역시</option>
		          <option value="광주광역시">광주광역시</option>
		          <option value="대전광역시">대전광역시</option>
		          <option value="울산광역시">울산광역시</option>
		          <option value="세종특별자치시">세종특별자치시</option>
		          <option value="경기도">경기도</option>
		          <option value="강원도">강원도</option>
		          <option value="충청북도">충청북도</option>
		          <option value="충청남도">충청남도</option>
		          <option value="전라북도">전라북도</option>
		          <option value="전라남도">전라남도</option>
		          <option value="경상북도">경상북도</option>
		          <option value="경상남도">경상남도</option>
		          <option value="제주특별자치도">제주특별자치도</option>
		        </select>
		      </div>
		    </div>
		    <div class="col">
		      <div class="search">
		        <select id="citySelect" name="loc_si">
		          <option value="">시/군/구 선택</option>
		        </select>
		      </div>
		    </div>
		  </div>
		</div>

        <!-- 수신동의 -->
        <div class="field">
          <label class="label">수신동의</label>
          <div class="agree-box">
            <label class="agree-item">
              <input type="checkbox" id="push_noti" name="push_noti" value="Y" />
              <span>푸시 동의 (선택)</span>
            </label>
            <label class="agree-item">
              <input type="checkbox" id="email_noti" name="email_noti" value="Y" />
              <span>이메일 수신 동의 (선택)</span>
            </label>
            <label class="agree-item">
              <input type="checkbox" id="sms_noti" name="sms_noti" value="Y" />
              <span>SMS 수신 동의 (선택)</span>
            </label>
          </div>
        </div>
		<div class="sub-button">
		  <button class="cancel" type="button" onclick="history.back()">취소</button>
		  <button class="submit" type="button" id="joinBtn">회원가입</button>
		</div>
        <div style="height: 30px"></div>
      </form>
    </div>
  </div>

  <script>
    const cityData = {
      '서울특별시': ['강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'],
      '부산광역시': ['해운대구','수영구','연제구','남구','동래구','부산진구','북구','사상구','사하구','금정구','동구','서구','중구','영도구','기장군'],
      '대구광역시': ['중구','동구','서구','남구','북구','수성구','달서구','달성군'],
      '인천광역시': ['중구','동구','미추홀구','연수구','남동구','부평구','계양구','서구','강화군','옹진군'],
      '광주광역시': ['동구','서구','남구','북구','광산구'],
      '대전광역시': ['동구','중구','서구','유성구','대덕구'],
      '울산광역시': ['중구','남구','동구','북구','울주군'],
      '세종특별자치시': ['세종시'],
      '경기도': ['수원시','용인시','성남시','고양시','부천시','안산시','안양시','남양주시','화성시','평택시','의정부시','시흥시','파주시','김포시','광주시','광명시','군포시','하남시','오산시','이천시','양주시','구리시','안성시','포천시','의왕시','여주시'],
      '강원도': ['춘천시','원주시','강릉시','동해시','속초시','삼척시','홍천군','횡성군','영월군','평창군','정선군','철원군','화천군','양구군','인제군','고성군','양양군'],
      '충청북도': ['청주시','충주시','제천시','보은군','옥천군','영동군','진천군','괴산군','음성군','단양군'],
      '충청남도': ['천안시','공주시','보령시','아산시','서산시','논산시','계룡시','당진시','금산군','부여군','서천군','청양군','홍성군','예산군','태안군'],
      '전라북도': ['전주시','익산시','군산시','정읍시','남원시','김제시','완주군','진안군','무주군','장수군','임실군','순창군','고창군','부안군'],
      '전라남도': ['목포시','여수시','순천시','나주시','광양시','담양군','곡성군','구례군','고흥군','보성군','화순군','장흥군','강진군','해남군','영암군','무안군','함평군','영광군','장성군','완도군','진도군','신안군'],
      '경상북도': ['포항시','경주시','김천시','안동시','구미시','영주시','영천시','상주시','문경시','경산시','군위군','의성군','청송군','영양군','영덕군','청도군','고령군','성주군','칠곡군','예천군','봉화군','울진군','울릉군'],
      '경상남도': ['창원시','진주시','통영시','사천시','김해시','밀양시','거제시','양산시','의령군','함안군','창녕군','고성군','남해군','하동군','산청군','함양군','거창군','합천군'],
      '제주특별자치도': ['제주시','서귀포시']
    };

    const provinceSelect = document.getElementById('provinceSelect');
    const citySelect = document.getElementById('citySelect');

    function renderCities(province){
      citySelect.innerHTML = '<option value="">시/군/구 선택</option>';
      (cityData[province] || []).forEach(city => {
        const opt = document.createElement('option');
        opt.value = city;
        opt.textContent = city;
        citySelect.appendChild(opt);
      });
    }

    provinceSelect.addEventListener('change', function(){
      renderCities(this.value);
    });
  </script>
</body>
</html>
