<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>컨텐츠 수정</title>
<link rel="stylesheet" href="../css/contents.css">
</head>
<body>

<div class="header-text" style="height: 200px;"></div>

<div class="seller-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2 style="color:black;">컨텐츠 수정</h2>
    <nav class="menu">
      <a class="tab-link active" data-step="0">컨텐츠 정보</a>
      <a class="tab-link" data-step="1">상세정보 작성</a>
      <a class="tab-link" data-step="2">대표 이미지</a>
      <a class="tab-link" data-step="3">가격옵션 설정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 id="pageTitle"></h2>

    <!-- ★★★ 큰 고정 박스 시작 ★★★ -->
    <div class="step-box">
      <form id="contentForm" method="post"
            action="../seller/contents_update_ok.eum"
            enctype="multipart/form-data">

        <!-- 수정에 필요한 기본값 -->
        <input type="hidden" name="b_id" value="${bvo.b_id}">
        <input type="hidden" name="originThumb" value="${bvo.b_thumbnail}">

        <!-- 1단계: 컨텐츠 정보 -->
        <section class="step active" id="step-0">
          <div class="form-grid">

            <!-- 제목 (b_title) -->
            <div class="form-row">
              <div class="field-label">제목</div>
              <div class="field-input">
                <input type="text" name="title"
                       placeholder="예: 나만의 맞춤형 운동 플랜 제작"
                       value="${bvo.b_title}"
                       required />
              </div>
            </div>

            <!-- 카테고리 (b_type) -->
            <div class="form-row">
              <div class="field-label">카테고리</div>
              <div class="field-input">
                <select name="category" required>
                  <option value="">카테고리를 선택해주세요</option>
                  <option value="운동건강"
                    <c:if test="${bvo.b_type eq '운동건강'}">selected</c:if>>
                    운동/건강
                  </option>
                  <option value="비즈니스"
                    <c:if test="${bvo.b_type eq '비즈니스'}">selected</c:if>>
                    비즈니스
                  </option>
                  <option value="취미/자기개발"
                    <c:if test="${bvo.b_type eq '취미/자기개발'}">selected</c:if>>
                    취미/자기개발
                  </option>
                  <option value="생활라이프"
                    <c:if test="${bvo.b_type eq '생활라이프'}">selected</c:if>>
                    생활/라이프
                  </option>
                  <option value="기타"
                    <c:if test="${bvo.b_type eq '기타'}">selected</c:if>>
                    기타
                  </option>
                </select>
              </div>
            </div>

            <!-- 진행 방식 (대면 / 비대면) = b_prod_on_off -->
            <div class="form-row">
              <div class="field-label">진행 방식</div>
              <div class="field-input">
                <div class="choice-row">
                  <label class="choice-btn">
                    <input type="radio" name="meetType" value="OFFLINE"
                      <c:if test="${bvo.b_prod_on_off eq 'OFFLINE'}">checked</c:if> />
                    <span>대면</span>
                  </label>
                  <label class="choice-btn">
                    <input type="radio" name="meetType" value="ONLINE"
                      <c:if test="${bvo.b_prod_on_off eq 'ONLINE'}">checked</c:if> />
                    <span>비대면</span>
                  </label>
                </div>
              </div>
            </div>

          </div>
        </section>

        <!-- 2단계: 상세 설명 -->
        <section class="step" id="step-1">
          <div class="form-grid">
            <div class="form-row">
              <div class="field-label">상세 설명</div>
              <div class="field-input">
                <textarea name="description"
                          placeholder="예: 서비스 설명, 제공 항목, 진행 방식 등을 자세히 적어주세요."
                          required>${bvo.b_content}</textarea>
                <div class="textarea-hint">
                  최소 50자 이상 입력하는 것을 추천합니다.
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- 3단계: 대표 이미지 (다중이미지 표시/수정 X) -->
        <section class="step" id="step-2">
          <h3>3. 대표 이미지 수정</h3>
          <p class="textarea-hint">
            새로운 대표 이미지를 업로드하지 않으면 기존 이미지가 유지됩니다.
          </p>

          <div class="form-grid">
            <!-- 대표 이미지 (b_thumbnail) -->
            <div class="form-row">
              <div class="field-label">대표 이미지</div>
              <div class="field-input">
                <div class="image-row">
                  <!-- 업로드 박스 -->
                  <div class="image-upload-box">
                    <div class="upload-text">
                      <strong>대표 이미지 (1장)</strong>
                      목록/상단에 노출될 대표 이미지를 선택해주세요.
                    </div>
                    <label class="upload-btn">
                      대표 이미지 변경
                      <input type="file" id="mainImageInput"
                             name="mainImage"
                             accept="image/*">
                    </label>
                  </div>

                  <!-- 대표 이미지 미리보기 -->
                  <div class="image-preview-grid image-preview-box"
                       id="mainImagePreview">
                    <c:if test="${not empty bvo.b_thumbnail}">
                      <div class="preview-item">
                        <img src="${bvo.b_thumbnail}">
                        <div class="preview-badge">현재 대표</div>
                      </div>
                    </c:if>
                  </div>
                </div>

                <div class="field-hint">
                  다중(서브) 이미지는 수정/추가가 불가능하며, 기존 이미지를 그대로 사용합니다.
                </div>
              </div>
            </div>

          </div>
        </section>

        <!-- 4단계: 가격 옵션 (있는 옵션만 수정, 추가 X) -->
        <section class="step" id="step-3">
          <h3>4. 가격 옵션 설정</h3>

          <div class="form-grid">
            <c:forEach var="op" items="${opList}" varStatus="st">
              <div class="option-card">
                <div class="option-header">옵션 ${st.index + 1}</div>

                <!-- 옵션 PK -->
                <input type="hidden" name="b_op_id" value="${op.b_op_id}">

                <!-- 옵션 제목 -->
                <div class="form-row">
                  <div class="field-label">가격 제목</div>
                  <div class="field-input">
                    <input type="text" name="b_op_title"
                           value="${op.b_op_title}"
                           placeholder="예: 기본 패키지" />
                  </div>
                </div>

                <!-- 옵션 가격 -->
                <div class="form-row">
                  <div class="field-label">가격</div>
                  <div class="field-input">
                    <input type="number" name="b_op_price"
                           value="${op.b_op_price}"
                           placeholder="예: 50000"
                           min="0" />
                    <div class="field-hint">원 단위로 입력해주세요.</div>
                  </div>
                </div>

                <!-- 옵션 설명 -->
                <div class="form-row">
                  <div class="field-label">가격 설명</div>
                  <div class="field-input">
                    <textarea name="b_op_detail"
                              placeholder="예: 포함 서비스 상세">${op.b_op_detail}</textarea>
                  </div>
                </div>
              </div>
            </c:forEach>

            <c:if test="${empty opList}">
              <p style="font-size: 14px; color: #6b7280;">
                등록된 옵션이 없습니다. (옵션 추가 기능은 지원하지 않습니다.)
              </p>
            </c:if>
          </div>
        </section>

        <!-- ★★★ 버튼은 항상 박스 우측하단 ★★★ -->
        <div class="wizard-footer">
          <button type="button" id="prevBtn"
                  class="nav-btn secondary"
                  style="display:none;">이전</button>
          <button type="button" id="nextBtn"
                  class="nav-btn">다음</button>
        </div>

      </form>
    </div>
    <!-- ★★★ 큰 고정 박스 끝 ★★★ -->

  </main>
</div>

<div class="header-text" style="height: 120px;"></div>

<script>
document.addEventListener('DOMContentLoaded', function () {
  const tabs    = document.querySelectorAll('.tab-link');
  const steps   = document.querySelectorAll('.step');
  const prevBtn = document.getElementById('prevBtn');
  const nextBtn = document.getElementById('nextBtn');
  const title   = document.getElementById('pageTitle');
  const form    = document.getElementById('contentForm');

  let currentStep = 0;
  const lastStep  = steps.length - 1; // 0~3 (4단계)

  function goToStep(index) {
    currentStep = index;

    // 제목 업데이트
    title.textContent = tabs[index].textContent;

    // 단계 내용 표시
    steps.forEach((step, i) => {
      step.classList.toggle('active', i === index);
    });

    // 왼쪽 탭 active 처리
    tabs.forEach((tab, i) => {
      tab.classList.toggle('active', i === index);
    });

    // 버튼 표시 조건
    prevBtn.style.display = index === 0 ? 'none' : 'inline-block';
    nextBtn.textContent   = index === lastStep ? '수정 완료' : '다음';
  }

  // 좌측 탭 클릭
  tabs.forEach((tab, index) => {
    tab.addEventListener('click', function (e) {
      e.preventDefault();
      goToStep(index);
    });
  });

  // 이전 버튼
  prevBtn.addEventListener('click', function () {
    if (currentStep > 0) goToStep(currentStep - 1);
  });

  // 다음 / 완료 버튼
  nextBtn.addEventListener('click', function () {
    if (currentStep < lastStep) {
      goToStep(currentStep + 1);
    } else {
      form.submit();
    }
  });

  // 초기 0단계로 세팅
  goToStep(0);

  // ===== 대표 이미지 미리보기 =====
  const mainImageInput   = document.getElementById('mainImageInput');
  const mainImagePreview = document.getElementById('mainImagePreview');

  if (mainImageInput && mainImagePreview) {
    mainImageInput.addEventListener('change', function () {
      mainImagePreview.innerHTML = '';

      const file = this.files[0];
      if (!file) return;

      const reader = new FileReader();
      reader.onload = function (e) {
        const item = document.createElement('div');
        item.className = 'preview-item';

        const img = document.createElement('img');
        img.src = e.target.result;

        const badge = document.createElement('div');
        badge.className = 'preview-badge';
        badge.textContent = '새 대표';

        item.appendChild(img);
        item.appendChild(badge);
        mainImagePreview.appendChild(item);
      };
      reader.readAsDataURL(file);
    });
  }
});
</script>

</body>
</html>
