<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<style>
.bg-purple {
  background-color: #9370DB !important; /* MediumPurple 색상 */
}
</style>

<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">

                <!-- ======================= -->
                <!--     ROW 1 : MAIN KPI    -->
                <!-- ======================= -->
                <div class="row mb-2">

                    <!-- 사용자 수 -->
                    <div class="col-md-3 mb-2">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <span class="h2 mb-0">
                                        	<fmt:formatNumber value="${userTotal }" type="number"/>
                                        </span>
                                        <p class="small text-muted mb-0"><strong>사용자 총 수</strong></p>
                                    </div>
                                    <div class="col-auto">
                                        <span class="fe fe-32 fe-users text-muted mb-0"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 판매자 수 -->
                    <div class="col-md-3 mb-2">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <span class="h2 mb-0">
                                        	<fmt:formatNumber value="${sellerTotal }" type="number"/>
                                        </span>
                                        <p class="small text-muted mb-0"><strong>셀러 총 수</strong></p>
                                    </div>
                                    <div class="col-auto">
                                        <span class="fe fe-32 fe-briefcase text-muted mb-0"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 컨텐츠 수 -->
                    <div class="col-md-3 mb-2">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <span class="h2 mb-0">
                                        	<fmt:formatNumber value="${contentsTotal }" type="number"/>
                                        </span>
                                        <p class="small text-muted mb-0"><strong>컨텐츠 총 수</strong></p>
                                    </div>
                                    <div class="col-auto">
                                        <span class="fe fe-32 fe-shopping-bag text-muted mb-0"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 리뷰 수 -->
                    <div class="col-md-3 mb-2">
                        <div class="card shadow">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <span class="h2 mb-0">
                                        	<fmt:formatNumber value="${reviewTotal}" type="number"/>
                                        </span>
                                        <p class="small text-muted mb-0"><strong>리뷰 총 수</strong></p>
                                    </div>
                                    <div class="col-auto">
                                        <span class="fe fe-32 fe-edit text-muted mb-0"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div><!-- END ROW 1 -->



               <!-- ======================= -->
				<!--     ROW 2 : Conversion + Visitors + Earning   -->
				<!-- ======================= -->
				<div class="row mb-3">
				
				    <!-- Conversion -->
				    <div class="col-md-3">
				        <div class="card shadow h-100">
				        	<div class="card-body d-flex flex-column justify-content-center">
				                <div class="row align-items-center">
				                    <div class="col-2 text-center">
				                        <span class="circle circle-sm bg-primary">
				                            <i class="fe fe-16 fe-user-plus text-white mb-0"></i>
				                        </span>
				                    </div>
				                    <div class="col">
				                        <p class="small text-muted mb-0"><strong>셀러 등록 비율</strong></p>
				                        <div class="row align-items-center no-gutters">
				                            <div class="col-auto">
				                                <span class="h3 mr-2 mb-0">${sellerRegTotal }%</span>
				                            </div>
				                            <div class="col-md-12 col-lg">
				                                <div class="progress progress-sm mt-2" style="height:3px">
				                                    <div class="progress-bar bg-success" role="progressbar" style="width: ${sellerRegTotal }%"></div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				
				    <div class="col-md-3">
					    <div class="card shadow h-100">
        					<div class="card-body d-flex flex-column justify-content-center">
					
					            <!-- 상단 (제목 + 숫자) -->
					            <small class="text-muted mb-0"><strong>신규 셀러</strong></small>
					            <h3 class="card-title mb-1">${sellerNew }</h3>
					
					            <!-- 하단 row (Total + Last week 변화율) -->
					            <div class="d-flex justify-content-between align-items-center">
					                <p class="small text-muted mb-0">This Week</p>
					                <div class="d-flex align-items-center text-success small">
					                    <span class="fe fe-arrow-up fe-12 mr-1"></span>
					                    <span>
					                    <c:if test="${sellerGrowth ==null}">
					                    	0
					                    </c:if>
					                    <c:if test="${sellerGrowth !=null}">
					                    	${sellerGrowth }
					                    </c:if>
					                    % Last week</span>
					                    
					                </div>
					            </div>
					
					        </div>
					    </div>
					</div>

				
				    <!-- EARNING (2칸) -->
				    <div class="col-md-6 ">
				        <div class="card shadow h-100">
				            <div class="card-body">
				                
				                <div class="row align-items-center text-center">
				
				                    <!-- Earning -->
				                    <div class="col-md-3 text-left">
				                        <p class="mb-0 text-uppercase text-muted"><strong>총 환불금액</strong></p>
				                        <h3 class="mb-1">
											<fmt:formatNumber value="${refundAmount}" type="currency" currencySymbol="$"/>
										</h3>
				                        <p class="text-muted mb-0 small">Lorem ipsum dolor </p>
				                    </div>
				
				                    <!-- Cost -->
				                    <div class="col-md-2">
				                        <p class="mb-0 text-muted"><strong>신규 환불</strong></p>
				                        <h4 class="mb-0">${refundNew }</h4>
				                        <p class="small text-muted mb-0">NEW</p>
				                    </div>
				
									<!-- Cost -->
				                    <div class="col-md-2">
				                        <p class="mb-0 text-muted"><strong>환불 접수</strong></p>
				                        <h4 class="mb-0">${refundReceiveTotal }</h4>
				                        <p class="small text-muted mb-0">Total</p>
				                    </div>	
									
				                    <!-- Revenue -->
				                    <div class="col-md-2">
				                        <p class="mb-0 text-muted"><strong>총 환불 수</strong></p>
				                        <h4 class="mb-0">${refundTotal }</h4>
				                        <p class="small text-muted mb-0">Total</p>
				                    </div>
				
				                    <!-- Circle Chart -->
				                    <div class="col-md-2 text-center">처리 완료
				                        <div style="width: 110px; margin: 0 auto;">
				                            <div id="radialbarWidget1"></div>
				                        </div>
				                    </div> 
				
				                </div>
				
				            </div>
				        </div>
				    </div>
				
				</div><!-- END ROW 2 -->




              <!-- ======================= -->
			<!--  ROW 3 : Line Chart + Category -->
			<!-- ======================= -->
			<div class="row mb-2">
			
			    <!-- Line Chart -->
			    <div class="col-md-8 mb-2 d-flex">
			        <div class="card shadow h-100 w-100">
			            <div class="card-header">
			                <strong class="card-title mb-0">월별 신규 가입자</strong>
			                <span class="badge badge-secondary float-right mr-2">30 days</span>
			            </div>
			            <div class="card-body">
			                <canvas id="lineChartjs"></canvas>
			            </div>
			        </div>
			    </div>
			
			    <!-- Category Donut -->
			    <div class="col-md-4 mb-2 d-flex">
			        <div class="card shadow h-100 w-100">
			            <div class="card-body">
			                <div class="chart-box mb-3">
			                    <div id="categoryChart"></div>
			                </div>
			
			                <%-- <div class="w-70 mx-auto ">--%>
			                    
			                    <!-- 리스트 내용 동일 -->
			                    <div class="row align-items-center mb-2 ">
			                        <div class="col">
			                            <p class="mb-0">운동건강</p>
			                        </div>
			                        <div class="col-auto text-right">
			                            <p class="mb-0">
			                            	<c:out value="${categoryCount.EXERCISE}" default="0"/> 개	
			                            </p>
			                            <span class="dot dot-md bg-danger"></span>
			                        </div>
			                    </div>
			                    <div class="row align-items-center mb-2">
			                        <div class="col">
			                            <p class="mb-0">비즈니스</p>
			                        </div>
			                        <div class="col-auto text-right">
			                            <p class="mb-0">
			                            	<c:out value="${categoryCount.BUSINESS}" default="0"/> 개
			                            </p>
			                            <span class="dot dot-md bg-primary"></span>
			                        </div>
			                    </div>
			                    <div class="row align-items-center mb-2">
			                        <div class="col">
			                            <p class="mb-0">취미/자기개발</p>
			                        </div>
			                        <div class="col-auto text-right">
			                            <p class="mb-0">
			                            	<c:out value="${categoryCount.HOBBY_DEV}" default="0"/> 개
			                            </p>
			                            <span class="dot dot-md bg-warning"></span>
			                        </div>
			                    </div>
			                    <div class="row align-items-center mb-2">
			                        <div class="col">
			                            <p class="mb-0">생활라이프</p>
			                        </div>
			                        <div class="col-auto text-right">
			                            <p class="mb-0">
			                            	<c:out value="${categoryCount.LIFE_STYLE}" default="0"/> 개
			                            </p>
			                            <span class="dot dot-md bg-success"></span>
			                        </div>
			                    </div>
			                    <div class="row align-items-center mb-2  ">
			                        <div class="col">
			                            <p class="mb-0">기타</p>
			                        </div>
			                        <div class="col-auto text-right">
			                            <p class="mb-0">
			                            <c:out value="${categoryCount.ETC}" default="0"/> 개
			                            </p>
			                            <span class="dot dot-md bg-purple"></span>
			                        </div>
			                    </div>
			
			 
			
			                <!-- </div>  -->
			            </div>
			        </div>
			    </div>
			
			</div><!-- END ROW 3 -->

				
				

            </div>
        </div>
    </div>

        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="list-group list-group-flush my-n3">
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-box fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Package has uploaded successfull</strong></small>
                        <div class="my-0 text-muted small">Package is zipped and uploaded</div>
                        <small class="badge badge-pill badge-light text-muted">1m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-download fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Widgets are updated successfull</strong></small>
                        <div class="my-0 text-muted small">Just create new layout Index, form, table</div>
                        <small class="badge badge-pill badge-light text-muted">2m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-inbox fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Notifications have been sent</strong></small>
                        <div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
                        <small class="badge badge-pill badge-light text-muted">30m ago</small>
                      </div>
                    </div> <!-- / .row -->
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-link fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Link was attached to menu</strong></small>
                        <div class="my-0 text-muted small">New layout has been attached to the menu</div>
                        <small class="badge badge-pill badge-light text-muted">1h ago</small>
                      </div>
                    </div>
                  </div> <!-- / .row -->
                </div> <!-- / .list-group -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Clear All</button>
              </div>
            </div>
          </div>
        </div>
      
 <!-- 필수 공통 JS -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/simplebar.min.js"></script>

<!-- 대시보드에서 실제 사용하는 플러그인만 유지 -->
<script src="js/daterangepicker.js"></script>
<script src="js/config.js"></script>

<!-- 차트 라이브러리 -->
<script src="js/Chart.min.js"></script>
<script>
  // Chart.js 기본 옵션
  Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
  Chart.defaults.global.defaultFontColor = colors.mutedColor;
</script>

<script src="js/apexcharts.min.js"></script>
<script src="js/apexcharts.custom.js"></script>

<!-- ===============================
     아래부터는 네가 사용 중인 직접 작성된 차트 스크립트
     =============================== -->

<script>
	var labels = [];
	var data = [];
	
	<c:forEach var="row" items="${usersGraph}">
	    labels.push("${row.MONTHS}");
	    data.push(${row.SIGNUP_COUNT});
	</c:forEach>
	
    var lineChartData = {
        labels: labels,
        datasets: [{
            label: "월별 신규 유저",
            borderColor: "rgba(75,192,192,1)",
            data: data,
            fill: false,
            lineTension: 0.2
        }]
    };

    var ChartOptions = {
        maintainAspectRatio: false,
        responsive: true
    };

    var ctx = document.getElementById("lineChartjs");

    ctx && new Chart(ctx, {
        type: "line",
        data: lineChartData,
        options: ChartOptions
    });
</script>

<script>
    var categoryCountData = {
        BUSINESS: <c:out value="${categoryCount.BUSINESS}" default="0"/>,
        LIFE_STYLE: <c:out value="${categoryCount.LIFE_STYLE}" default="0"/>,
        HOBBY_DEV: <c:out value="${categoryCount.HOBBY_DEV}" default="0"/>,
        EXERCISE: <c:out value="${categoryCount.EXERCISE}" default="0"/>,
        ETC: <c:out value="${categoryCount.ETC}" default="0"/>
    };
	
    var totalCount = 
        categoryCountData.BUSINESS + 
        categoryCountData.LIFE_STYLE + 
        categoryCountData.HOBBY_DEV + 
        categoryCountData.EXERCISE + 
        categoryCountData.ETC;

    var categoryChartOptions = {
        series: [
            (categoryCountData.BUSINESS / totalCount)* 100,
            (categoryCountData.LIFE_STYLE / totalCount)* 100,
            (categoryCountData.HOBBY_DEV / totalCount)* 100,
            (categoryCountData.EXERCISE / totalCount)* 100,
            (categoryCountData.ETC / totalCount)* 100
        ],
        chart: {
            id: "category_cta", 
            height: 200,
            type: "radialBar"
        },
        labels: ["비즈니스", "생활라이프", "취미/자기개발", "운동건강", "기타"],
    };

    var categoryChartElement = document.querySelector("#categoryChart");
    if (categoryChartElement) {
        new ApexCharts(categoryChartElement, categoryChartOptions).render();
    }
</script>

<script>
var refundNew = ${refundNew};
var refundReceiveTotal = ${refundReceiveTotal};
var refundTotal = ${refundTotal};

// 처리 완료 개수
var completed = refundTotal - (refundNew + refundReceiveTotal);
if (completed < 0) completed = 0;

// 비율
var percent = refundTotal > 0 ? (completed / refundTotal) * 100 : 0;

var radialbarWidgetOptions = {
    series: [percent],
    chart: { height: 120, type: "radialBar" },
    plotOptions: {
        radialBar: {
            hollow: { size: "70%" },
            dataLabels: {
                name: { show: false },
                value: {
                    formatter: () => completed,
                    fontSize: "1.5rem",
                    fontWeight: 700,
                    show: true,
                    color: "#333",
                }
            }
        }
    },
    fill: {
        type: "gradient",
        gradient: {
            gradientFromColors: ["#BB86FC"],
            gradientToColors: ["#6200EE"],
            stops: [20, 100]
        }
    },
    stroke: { lineCap: "round" }
};

var radialEl = document.querySelector("#radialbarWidget1");
if (radialEl) {
    new ApexCharts(radialEl, radialbarWidgetOptions).render();
}
</script>
