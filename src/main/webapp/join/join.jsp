<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet" href="../css/join.css">
  <style>
    .join-container{max-width:1170px;margin:0 auto;padding:48px 16px;display:flex;justify-content:center; font-weight: bold;}
    .panel{width:100%;max-width:420px}
    .title{font-size:26px;font-weight:800;line-height:1.35;margin:0 0 8px}
    .subtitle{font-size:13px;color:var(--muted);margin:0 0 24px}
    .subtitle a{color:inherit;font-weight:700;text-decoration:none}

    /* 폼 공통: 모든 항목을 세로로 한 줄씩/동일 간격 */
    .form{display:flex;flex-direction:column;gap:22px}
    .field{display:block}
    .label{display:block;font-size:13px;font-weight:700;margin-bottom:8px}

    .search{
      height:44px;display:flex;align-items:center;padding:0 .8em;
      border-bottom:1px solid #7453fc;background:#fff
    }
    .search_input,.search select{
      width:100%;height:100%;border:none;background:transparent;font-size:13px
    }
    .search_input:focus,.search select:focus{outline:none}

    /* 아이디: 입력 + 버튼(기능 없음, UI만) */
    .id-inline{display:flex;gap:8px;align-items:center}
    .id-inline .search{flex:1}
    .btn{
      height:44px;padding:0 14px;border:1px solid #111827;background:#111827;color:#fff;
      border-radius:10px;cursor:pointer;font-weight:700;font-size:13px;white-space:nowrap;
    }

    .radio-wrap{display:flex;gap:14px}
    .agree-box{border:1px solid var(--border);border-radius:12px;background:#f9fafb;padding:14px}
    .agree-item{display:flex;gap:10px;align-items:center;padding:8px 4px}
    .agree-item + .agree-item{border-top:1px dashed var(--border)}

	.row { display:flex; gap:12px; }
	.col { flex:1; }

    .submit{margin-top:8px;width:100%;padding:14px 16px;border:0;border-radius:12px;background:#7453fc;color:#fff;font-weight:800;font-size:15px;cursor:pointer}
  </style>
</head>
<body>
<div class="header-text" style="height: 150px;"></div>
  <div class="join-container">
    <div class="panel">
      <h1 class="title" style="color:black">회원가입하고<br/>비즈니스 성공을 시작해 보세요!</h1>
      <p class="subtitle">이미 계정이 있으신가요? <a href="<c:url value='/login'/>">로그인하기</a></p>

      <form class="form" method="post" action="<c:url value='/join/submit.eum'/>">
        <!-- 아이디 (버튼만, 기능 없음) -->
        <div class="field">
          <label class="label" for="u_loginId">아이디</label>
          <div class="id-inline">
            <div class="search">
              <input class="search_input" id="u_loginId" name="u_loginId" type="text" placeholder="아이디" />
            </div>
            <button type="button" id="btnIdCheck" class="btn">중복체크</button>
          </div>
        </div>

        <!-- 닉네임 -->
        <div class="field">
          <label class="label" for="u_nickname">닉네임</label>
          <div class="search">
            <input class="search_input" id="u_nickname" name="u_nickname" type="text" placeholder="닉네임" />
          </div>
        </div>

        <!-- 이메일 -->
        <div class="field">
          <label class="label" for="u_email">이메일</label>
          <div class="search">
            <input class="search_input" id="u_email" name="u_email" type="email" placeholder="이메일" />
          </div>
        </div>

        <!-- 휴대폰 -->
        <div class="field">
          <label class="label" for="u_phone">휴대폰 번호</label>
          <div class="search">
            <input class="search_input" id="u_phone" name="u_phone" type="text" placeholder="010-0000-0000" />
          </div>
        </div>

        <!-- 비밀번호 -->
        <div class="field">
          <label class="label" for="u_pwd">비밀번호</label>
          <div class="search">
            <input class="search_input" id="u_pwd" name="u_pwd" type="password" placeholder="비밀번호" />
          </div>
        </div>

        <!-- 비밀번호 확인 -->
        <div class="field">
          <label class="label" for="u_pwd_check">비밀번호 확인</label>
          <div class="search">
            <input class="search_input" id="u_pwd_check" type="password" placeholder="비밀번호 재입력" />
          </div>
        </div>

        <!-- 성별 -->
        <div class="field">
          <label class="label">성별</label>
          <div class="radio-wrap">
            <label><input type="radio" name="u_gender" value="M" /> 남성</label>
            <label><input type="radio" name="u_gender" value="F" /> 여성</label>
          </div>
        </div>

        <!-- 생년월일 -->
        <div class="field">
          <label class="label" for="u_birth">생년월일</label>
          <div class="search">
            <input class="search_input" id="u_birth" name="u_birth" type="date" />
          </div>
        </div>

        <div class="field">
		  <label class="label">주소</label>
		  <div class="row">
		    <div class="col">
		      <div class="search">
		        <select id="provinceSelect" name="u_loc_do">
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
		        <select id="citySelect" name="u_loc_si">
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
              <input type="checkbox" id="u_push_noti" name="u_push_noti" value="Y" />
              <span>푸시 동의 (선택)</span>
            </label>
            <label class="agree-item">
              <input type="checkbox" id="u_email_noti" name="u_email_noti" value="Y" />
              <span>이메일 수신 동의 (선택)</span>
            </label>
            <label class="agree-item">
              <input type="checkbox" id="u_sms_noti" name="u_sms_noti" value="Y" />
              <span>SMS 수신 동의 (선택)</span>
            </label>
          </div>
        </div>

        <button class="submit" type="submit">회원가입</button>
      </form>
    </div>
  </div>

  <!-- 주소 시/군/구 연동 전용 스크립트(중복체크 기능 없음) -->
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
