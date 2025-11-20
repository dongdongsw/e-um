<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>컨텐츠 등록</title>
<link rel="stylesheet" href="../css/contents.css">
</head>
<body>
	<div class="header-text" style="height: 200px;"></div>
	<div class="seller-container">
		<aside class="sidebar">
			<h2 style="color: black;">컨텐츠 등록</h2>
			<nav class="menu">
				<span class="tab-link active" data-step="0">컨텐츠 정보</span> <span
					class="tab-link" data-step="1">상세정보 작성</span> <span
					class="tab-link" data-step="2">이미지 삽입</span> <span class="tab-link"data-step="3">가격옵션 설정</span>
			</nav>
		</aside>

		<main class="content">
			<h2 id="pageTitle"></h2>

			<div class="step-box">
				<form id="contentForm" method="post"
					action="../seller/contents_insert_ok.eum"
					enctype="multipart/form-data">

					<!-- 1단계: 컨텐츠 정보 -->
					<section class="step active" id="step-0">
						<div class="form-grid">

							<!-- 제목 (b_title) -->
							<div class="form-row">
								<div class="field-label">제목</div>
								<div class="field-input">
									<input type="text" name="title"
										placeholder="예: 나만의 맞춤형 운동 플랜 제작" required />
								</div>
							</div>

							<!-- 카테고리 (b_type) -->
							<div class="form-row">
								<div class="field-label">카테고리</div>
								<div class="field-input">
									<select name="category" required>
										<option value="">카테고리를 선택해주세요</option>
										<option value="운동건강">운동/건강</option>
										<option value="비즈니스">비즈니스</option>
										<option value="취미/자기개발">취미/자기개발</option>
										<option value="생활라이프">생활/라이프</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>

							<!-- 진행 방식 (대면 / 비대면) -->
							<div class="form-row">
								<div class="field-label">진행 방식</div>
								<div class="field-input">
									<div class="choice-row">
										<label class="choice-btn"> <input type="radio"
											name="meetType" value="OFFLINE" required> <span>대면</span>
										</label> <label class="choice-btn"> <input type="radio"
											name="meetType" value="ONLINE"> <span>비대면</span>
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
										placeholder="예: 서비스 설명, 제공 항목, 진행 방식 등을 자세히 적어주세요." required></textarea>
									<div class="textarea-hint">최소 50자 이상 입력하는 것을 추천합니다.</div>
								</div>
							</div>
						</div>
					</section>

					<!-- 3단계: 이미지 삽입 -->
					<section class="step" id="step-2">
						<h3>3. 이미지 삽입</h3>
						<p class="textarea-hint">대표 이미지는 1장, 서브 이미지는 최대 5장까지 업로드할 수
							있습니다.</p>

						<div class="form-grid">
							<!-- 대표 이미지 (b_thumbnail) -->
							<div class="form-row">
								<div class="field-label">대표 이미지</div>
								<div class="field-input">
									<div class="image-row">
										<!-- 업로드 박스 -->
										<div class="image-upload-box">
											<div class="upload-text">
												<strong>대표 이미지 (1장, 필수)</strong> 목록/상단에 노출될 대표 이미지를 선택해주세요.
											</div>
											<label class="upload-btn"> 대표 이미지 선택 <input
												type="file" id="mainImageInput" name="mainImage"
												accept="image/*" required>
											</label>
										</div>

										<!-- 대표 이미지 미리보기 -->
										<div class="image-preview-grid image-preview-box"
											id="mainImagePreview"></div>
									</div>
								</div>
							</div>

							<!-- 서브 이미지 (b_img_url) -->
							<div class="form-row">
								<div class="field-label">서브 이미지</div>
								<div class="field-input">
									<div class="image-row">
										<!-- 업로드 박스 -->
										<div class="image-upload-box">
											<div class="upload-text">
												<strong>서브 이미지 (최대 5장)</strong> 상세 페이지에 노출될 추가 이미지를 업로드해주세요.
											</div>
											<label class="upload-btn"> 서브 이미지 선택 <input
												type="file" id="subImageInput" name="subImages" multiple
												accept="image/*">
											</label>
										</div>

										<!-- 서브 이미지 미리보기 -->
										<div class="image-preview-grid image-preview-box"
											id="subImagePreview"></div>
									</div>

									<div class="field-hint">서브 이미지는 서비스 예시, 전/후 사진, 상세 컷 등을
										올려주세요.</div>
								</div>
							</div>
						</div>
					</section>

					<!-- 4단계: 가격 옵션 -->
					<section class="step" id="step-3">
						<h3>4. 가격 옵션 설정</h3>

						<div class="form-grid">
							<!-- 옵션 1 (필수) -->
							<div class="option-card">
								<div class="option-header">옵션 1 (필수)</div>

								<div class="form-row">
									<div class="field-label">가격 제목</div>
									<!-- b_op_title -->
									<div class="field-input">
										<input type="text" name="priceTitle1" placeholder="예: 기본 패키지"
											required />
									</div>
								</div>

								<div class="form-row">
									<div class="field-label">가격</div>
									<!-- b_op_price -->
									<div class="field-input">
										<input type="number" name="price1" placeholder="예: 50000"
											min="0" required />
										<div class="field-hint">원 단위로 입력해주세요.</div>
									</div>
								</div>

								<div class="form-row">
									<div class="field-label">가격 설명</div>
									<!-- b_op_detail -->
									<div class="field-input">
										<textarea name="priceDesc1"
											placeholder="예: 1:1 맞춤 상담 1회 + 기본 플랜 제공" required></textarea>
									</div>
								</div>
							</div>

							<!-- 옵션 2 -->
							<div class="option-card">
								<div class="option-header">옵션 2</div>

								<div class="form-row">
									<div class="field-label">가격 제목</div>
									<div class="field-input">
										<input type="text" name="priceTitle2"
											placeholder="예: 프리미엄 패키지 (선택)" />
									</div>
								</div>

								<div class="form-row">
									<div class="field-label">가격</div>
									<div class="field-input">
										<input type="number" name="price2" placeholder="예: 90000"
											min="0" />
									</div>
								</div>

								<div class="form-row">
									<div class="field-label">가격 설명</div>
									<div class="field-input">
										<textarea name="priceDesc2"
											placeholder="예: 기본 서비스 + 추가 코칭 1회 포함"></textarea>
									</div>
								</div>
							</div>

							<!-- 옵션 3 -->
							<div class="option-card">
								<div class="option-header">옵션 3</div>

								<div class="form-row">
									<div class="field-label">가격 제목</div>
									<div class="field-input">
										<input type="text" name="priceTitle3"
											placeholder="예: VIP 패키지 (선택)" />
									</div>
								</div>

								<div class="form-row">
									<div class="field-label">가격</div>
									<div class="field-input">
										<input type="number" name="price3" placeholder="예: 150000"
											min="0" />
									</div>
								</div>

								<div class="form-row">
									<div class="field-label">가격 설명</div>
									<div class="field-input">
										<textarea name="priceDesc3"
											placeholder="예: 모든 서비스 + 사후 관리까지 포함"></textarea>
									</div>
								</div>
							</div>
						</div>
					</section>

					<div class="wizard-footer">
						<button type="button" id="prevBtn" class="nav-btn secondary"
							style="display: none;">이전</button>
						<button type="button" id="nextBtn" class="nav-btn">다음</button>
					</div>

				</form>
			</div>

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
  const lastStep  = steps.length - 1; 

  function goToStep(index) {
    currentStep = index;

    title.textContent = tabs[index].textContent;

    steps.forEach((step, i) => {
      step.classList.toggle('active', i === index);
    });

    tabs.forEach((tab, i) => {
      tab.classList.toggle('active', i === index);
    });

    prevBtn.style.display = index === 0 ? 'none' : 'inline-block';
    nextBtn.textContent   = index === lastStep ? '작성 완료' : '다음';
  }

  tabs.forEach((tab, index) => {
    tab.addEventListener('click', function (e) {
      e.preventDefault();
    });
  });
  

  // 이전 버튼
  prevBtn.addEventListener('click', function () {
    if (currentStep > 0) goToStep(currentStep - 1);
  });

//다음 / 작성 완료 버튼 
  nextBtn.addEventListener('click', function () {
    const currentSection = steps[currentStep];

    const inputs = currentSection.querySelectorAll('input, select, textarea');

    for (const el of inputs) {
      const type = el.type;

      if (type === 'radio' || type === 'file') {
        continue;
      }

      if (!el.checkValidity()) {
        el.reportValidity(); 
        el.focus();
        return; 
      }
    }

    if (currentStep === 0) {
      const meetChecked = currentSection.querySelector('input[name="meetType"]:checked');
      if (!meetChecked) {
        alert("진행 방식을 선택해주세요.");
        const firstRadio = currentSection.querySelector('input[name=\"meetType\"]');
        if (firstRadio) firstRadio.focus();
        return;
      }
    }

    if (currentStep === 2) {
      const mainImageInput = document.getElementById("mainImageInput");
      if (mainImageInput && mainImageInput.files.length === 0) {
        alert("대표 이미지를 선택해주세요.");
        mainImageInput.focus();
        return;
      }
    }

    if (currentStep < lastStep) {
      goToStep(currentStep + 1);
    } else {
      form.submit();
    }
  });

  goToStep(0);

  const mainImageInput   = document.getElementById('mainImageInput');
  const mainImagePreview = document.getElementById('mainImagePreview');
  const subImageInput    = document.getElementById('subImageInput');
  const subImagePreview  = document.getElementById('subImagePreview');

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
        badge.textContent = '대표';

        item.appendChild(img);
        item.appendChild(badge);
        mainImagePreview.appendChild(item);
      };
      reader.readAsDataURL(file);
    });
  }

  if (subImageInput && subImagePreview) {
    subImageInput.addEventListener('change', function () {
      subImagePreview.innerHTML = '';

      const files = Array.from(this.files).slice(0, 5);

      files.forEach((file) => {
        const reader = new FileReader();
        reader.onload = function (e) {
          const item = document.createElement('div');
          item.className = 'preview-item';

          const img = document.createElement('img');
          img.src = e.target.result;

          const badge = document.createElement('div');
          badge.className = 'preview-badge';
          badge.textContent = '서브';

          item.appendChild(img);
          item.appendChild(badge);
          subImagePreview.appendChild(item);
        };
        reader.readAsDataURL(file);
      });
    });
  }
});
</script>

</body>
</html>