<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/join.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script type="text/javascript">

$(function(){
 
  $('#sellerBtn').click(function(){
		let sn=$('#seller_name').val()
		if(sn.trim()==="") {
			$('#sn_msg').text("셀러 이름을 입력하세요")
			$('#sn_msg').attr("class","message error")
			$('#sn_msg').css('color', 'red')
			$('#sn_msg').show()
			return
		}
		$.ajax({
			type:'post',
			url:'../seller/seller_name_ok.eum',
			data:{"u_s_com":sn},
			success:function(result) {
				if(result==0) {
					$('#sn_msg').text(sn+ '는(은) 사용 가능한 셀러 이름입니다')
					$('#sn_msg').attr("class","message success")
					$('#sn_msg').css('color', 'green')
					$('#sn_msg').show()
				} else {
					$('#sn_msg').text(sn+ '는(은) 이미 사용 중인 셀러 이름입니다')
					$('#sn_msg').attr("class","message error")
					$('#sn_msg').css('color', 'red')
					$('#sn_msg').show()
					}
				}, 
				error:function(err) {
					console.log(err)
				}
			})
				
		})
		
  // 사업자번호 인증
  $('#bizCheckBtn').click(function(){
    const no = $('#biz_no').val();

    $('#biz_msg').text('').css({color:'#333'});
    $('#biz_verified').val('N');

    if (no.length !== 10) {
      $('#biz_msg').text('사업자등록번호는 숫자 10자리여야 합니다').css('color','red');
      $('#biz_no').focus();
      return;
    }

    const payload = { b_no: [ no ] };

    $.ajax({
      url: 'https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=cersZ70uxWU0ccYpSBAAT5gRkiOl1q3Pqr2GbOvzC0zzyQD073VSzVr0mYlqVldzVqlnc0pW2/K/u7dU1s6AfA==',
      type: 'POST',
      data: JSON.stringify(payload),
      dataType: 'JSON',
      contentType: 'application/json',
      success: function(res){
        // 기본 구조 안전 검사
        const item = res && res.data && res.data[0] ? res.data[0] : null;
        if (!item) {
          $('#biz_msg').text('조회 결과가 없습니다. 번호를 다시 확인해주세요').css('color','red');
          return;
        }

        // 상태코드: 01=계속사업자, 02=휴업자, 03=폐업자
        const code = item.b_stt_cd; 
        const status = item.b_stt || '';

        if (code === '01') {
          $('#biz_msg').text('유효한 사업자등록번호입니다 (' + status + ')').css('color','green');
          $('#biz_verified').val('Y');
        } else if (code === '02' || code === '03') {
          $('#biz_msg').text((status || '휴업/폐업') + ' 상태의 사업자번호입니다').css('color','red');
          $('#biz_verified').val('N');
        } else {
          $('#biz_msg').text('유효하지 않은 사업자등록번호입니다').css('color','red');
          $('#biz_verified').val('N');
        }
      },
      error: function(xhr){
        console.log(xhr.responseText);
        $('#biz_msg').text('인증 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요').css('color','red');
        $('#biz_verified').val('N');
      }
    });
  });

  $('#joinBtn').click(function(){
    let seller_name=$('#seller_name').val();
    if(seller_name.trim()==="") {
      alert("셀러이름 중복체크를 하세요");
      $('#seller_name').focus();
      return;
    }

    let biz_no=$('#biz_no').val();
    if(biz_no.trim()==="") {
      alert("사업자 등록 번호를 인증하세요");
      $('#biz_no').focus();
      return;
    }
	
    if($('#biz_verified').val()!=='Y'){
        alert("사업자 등록 번호를 인증하세요");
        $('#biz_no').focus();
        return;
    }
    
    let loc_do=$('#loc_do').val();
    if(loc_do==="") {
      alert("도/광역시를 선택하세요");
      $('#loc_do').focus();
      return;
    }
    
    let loc_si=$('#loc_si').val();
    if(loc_si.trim()==="") {
      alert("시/군/구를 선택하세요");
      $('#loc_si').focus();
      return;
    }

    let carrer=$('#carrer').val();
    if(carrer.trim()==="") {
      alert("경력을 입력하세요");
      $('#carrer').focus();
      return;
    }

    $('#frm').submit();
  });
});
</script>

<style type="text/css">
.profile-upload {
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 5px;
  cursor: pointer;
}
.field {
  margin-bottom: 50px;
}
</style>
</head>
<body>
<div class="header-text" style="height: 150px; background-color: #fff;"></div>
  <div class="join-container">
    <div class="panel">
      <h1 class="title" style="color:black; text-align:center">
  		<span style="font-size: 30px;">셀러 가입</span>하고<br/>재능 판매를 시작해 보세요!
	 </h1>
 
	  <div style="height: 50px"></div>
     <form id="frm" name="frm" method="post" action="../seller/seller_join_ok.eum">
 		<input type="hidden" id="biz_verified" name="biz_verified" value="N">
		
        <!-- 셀러 닉네임 -->
        <div class="field" style="margin-bottom:0px">
          <label class="label">셀러 이름<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="id-inline">
            <div class="search">
              <input class="search_input" id="seller_name" name="seller_name" type="text" placeholder="셀러 이름"/>
            </div>
            <button type="button" id="sellerBtn" class="btn">중복체크</button>
          </div>
           <div id="sn_msg" style="color:black; height: 50px; margin-left:20px"></div>
        </div>
        
        <!-- 사업자 등록 번호 -->
		<div class="field" style="margin-bottom:0px">
		  <label class="label">사업자 등록 번호<sup style="color: #a50021">&nbsp;*</sup></label>
		  <div class="id-inline">
		    <div class="search">
		      <!-- 예: 3988701116 -->
		      <input class="search_input" id="biz_no" name="biz_no" type="text" placeholder="사업자 등록 번호 (숫자만 입력)" />
		    </div>
		    <button type="button" id="bizCheckBtn" class="btn">인증</button>
		  </div>
		  <div id="biz_msg" style="color:black; height: 50px; margin-left:20px"></div>
		</div>

		
        
        <div class="field">
		  <label class="label">서비스 지역<sup style="color: #a50021">&nbsp;*</sup></label>
		  <div class="row">
		    <div class="col">
		      <div class="search">
		        <select id="loc_do" name="loc_do">
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
		        <select id="loc_si" name="loc_si">
		          <option value="">시/군/구 선택</option>
		        </select>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		        <!-- 셀러 경력 -->
		<div class="field" style="margin-top:0px; width: 120px;">
		  <label class="label" for="u_s_biz_no">경력<sup style="color: #a50021">&nbsp;*</sup></label>
		  <div class="id-inline">
		    <div class="search">
		      <input class="search_input" id="carrer" name="carrer" type="text" placeholder="경력"/>
		    </div>
		    년
		  </div>
		</div>

		<div class="sub-button">
		  <button class="cancel" type="button" onclick="history.back()">취소</button>
		  <button class="submit" type="button" id="joinBtn">셀러 가입</button>
		</div>
        
        <div style="height: 70px"></div>
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

    const loc_do = document.getElementById('loc_do');
    const loc_si = document.getElementById('loc_si');

    function renderCities(province){
    	loc_si.innerHTML = '<option value="">시/군/구 선택</option>';
      (cityData[province] || []).forEach(city => {
        const opt = document.createElement('option');
        opt.value = city;
        opt.textContent = city;
        loc_si.appendChild(opt);
      });
    }

      loc_do.addEventListener('change', function(){
      renderCities(this.value);
    });
  </script>
</body>
</html>