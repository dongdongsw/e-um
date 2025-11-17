<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<style>
.text-normal {
    color: #4a4a4a !important;
}
/* 금액, 주문번호, 결제번호, 결제방법 열 중앙 정렬 */
.orders-table td:nth-child(4),
.orders-table td:nth-child(7),
.orders-table td:nth-child(8),
.orders-table td:nth-child(9),
.orders-table th:nth-child(4),
.orders-table th:nth-child(7),
.orders-table th:nth-child(8),
.orders-table th:nth-child(9) {
    text-align: center !important;
}

td a{
	text-decoration: none;
	color:black;
}

</style>
<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="h3 mb-3 page-title">Orders</h2>
              <div class="row mb-4 items-align-center">
                <form method="get" action="admin_orders_list.eum" class="form-inline">
								  <div class="form-row">
								    <div class="form-group col-auto">
								      <label for="search" class="sr-only">Search</label>
								      <input type="text" class="form-control" id="search"
								             name="keyword"  
								             value="${keyword}"
								             placeholder="Search">
								    </div>
								  </div>
								</form>
                <div class="col-md-auto ml-auto text-right">
                  <button type="button" class="btn" data-toggle="modal" data-target=".modal-slide"><span class="fe fe-filter fe-16 text-muted"></span></button>
                  <button type="button" class="btn"><span class="fe fe-refresh-ccw fe-16 text-muted"></span></button>
                </div>
              </div>
              <!-- Slide Modal -->
              <div class="modal fade modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="defaultModalLabel">Filters</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fe fe-x fe-12"></i>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="p-2">
                        <div class="form-group my-4">
                          <p class="mb-2"><strong>Regions</strong></p>
                          <label for="multi-select2" class="sr-only"></label>
                          <select class="form-control select2-multi" id="multi-select2">
                            <optgroup label="Mountain Time Zone">
                              <option value="AZ">Arizona</option>
                              <option value="CO">Colorado</option>
                              <option value="ID">Idaho</option>
                              <option value="MT">Montana</option>
                              <option value="NE">Nebraska</option>
                              <option value="NM">New Mexico</option>
                              <option value="ND">North Dakota</option>
                              <option value="UT">Utah</option>
                              <option value="WY">Wyoming</option>
                            </optgroup>
                            <optgroup label="Central Time Zone">
                              <option value="AL">Alabama</option>
                              <option value="AR">Arkansas</option>
                              <option value="IL">Illinois</option>
                              <option value="IA">Iowa</option>
                              <option value="KS">Kansas</option>
                              <option value="KY">Kentucky</option>
                              <option value="LA">Louisiana</option>
                              <option value="MN">Minnesota</option>
                              <option value="MS">Mississippi</option>
                              <option value="MO">Missouri</option>
                              <option value="OK">Oklahoma</option>
                              <option value="SD">South Dakota</option>
                              <option value="TX">Texas</option>
                              <option value="TN">Tennessee</option>
                              <option value="WI">Wisconsin</option>
                            </optgroup>
                          </select>
                        </div> <!-- form-group -->
                        <div class="form-group my-4">
                          <p class="mb-2">
                            <strong>Payment</strong>
                          </p>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1">Paypal</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                            <label class="custom-control-label" for="customCheck2">Credit Card</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1-1" checked>
                            <label class="custom-control-label" for="customCheck1">Wire Transfer</label>
                          </div>
                        </div> <!-- form-group -->
                        <div class="form-group my-4">
                          <p class="mb-2">
                            <strong>Types</strong>
                          </p>
                          <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
                            <label class="custom-control-label" for="customRadio1">End users</label>
                          </div>
                          <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" checked>
                            <label class="custom-control-label" for="customRadio2">Whole Sales</label>
                          </div>
                        </div> <!-- form-group -->
                        <div class="form-group my-4">
                          <p class="mb-2">
                            <strong>Completed</strong>
                          </p>
                          <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch1">
                            <label class="custom-control-label" for="customSwitch1">Include</label>
                          </div>
                        </div> <!-- form-group -->
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn mb-2 btn-primary btn-block">Apply</button>
                      <button type="button" class="btn mb-2 btn-secondary btn-block">Reset</button>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- Table -->
              <table class="table border table-hover bg-white orders-table">

                <thead>
                  <tr role="row">
                    <th>
                      <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="all">
                        <label class="custom-control-label" for="all"></label>
                      </div>
                    </th>
                    <th><strong>ID</strong></th>
                    <th><strong>닉네임</strong></th>
                    <th><strong>금액</strong></th>
                    <th><strong>구매일</strong></th>
                    <th><strong>주문상태</strong></th>
                    <th><strong>주문번호</strong></th>
                    <th><strong>결제번호</strong></th>
                    <th><strong>결제방법</strong></th>
                    <th><strong>결제상태</strong></th>
                    <th><strong>환불</strong></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="orders_list" items="${orders_list }"> 
                  <tr>
                    <td class="align-center">
                      <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input">
                        <label class="custom-control-label"></label>
                      </div>
                    </td>
                    <td class="text-normal">${orders_list.o_id }</td>
                    <td>
                    	<a href="../admin/admin_users_detail.eum?u_id=${orders_list.uvo.u_id }">
                    		${orders_list.uvo.u_nickname }
                    	</a>
                    </td>
                    <td class="text-normal">${orders_list.o_total_price }</td>
                    <td class="text-normal">
                    	<fmt:formatDate value="${orders_list.o_createdat}" pattern="yyyy-MM-dd" />
                    </td>
                    <td class="text-normal">${orders_list.o_status }</td>
                    <td class="text-normal">${orders_list.pvo.merchant_uid }</td>
                    <td class="text-normal">${orders_list.pvo.pay_id }</td>
                    <td class="text-normal">${orders_list.pvo.pay_method }</td>
                    <td class="text-normal">${orders_list.pvo.status}</td>
                    <td class="text-normal">
					    <c:if test="${orders_list.pvo.rfvo.rf_status != null}">
					        <button class="btn btn-warning btn-refund"
							    data-rfid="${orders_list.pvo.rfvo.rf_id}"
							    data-reason="${orders_list.pvo.rfvo.rf_reason}"
							    data-amount="${orders_list.pvo.rfvo.rf_amount}"
							    data-status="${orders_list.pvo.rfvo.rf_status}"
							    data-requested="<fmt:formatDate value='${orders_list.pvo.rfvo.rf_requestedat}' pattern='yyyy-MM-dd HH:mm'/>"
							    data-completed="<fmt:formatDate value='${orders_list.pvo.rfvo.rf_completedat}' pattern='yyyy-MM-dd HH:mm'/>">
							    환불보기
							</button>

					    </c:if>
					</td>


                    
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="../admin/admin_users_detail.eum?u_id=${orders_list.uvo.u_id }">프로필</a>
                          <a class="dropdown-item" href="#">Remove</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  </c:forEach>
                 
                 
                </tbody>
              </table>
              
              <!-- pagenations -->
              <nav aria-label="Table Paging" class="my-3">
                <ul class="pagination justify-content-end mb-0">
                   <c:if test="${startPage > 1 }">
                     <li class="page-item">
                     	<a class="page-link" href="../admin/admin_orders_list.eum?page=${startPage-1 }&keyword=${keyword}">&lt;</a>
                     </li>
                   </c:if>
                   <c:forEach var="i" begin="${startPage }" end="${endPage }">
                     <li class="page-item ${i==curpage?'active':'' }" >
                     	<a class="page-link" href="../admin/admin_orders_list.eum?page=${i }&keyword=${keyword}">${i }</a>
                     </li>
                   </c:forEach>  
                   <c:if test="${endPage < totalpage }">
                     <li class="page-item">
                     <a class="page-link" href="../admin/admin_orders_list.eum?page=${endPage+1 }&keyword=${keyword}">&gt;</a>
                     </li>
                   </c:if>
                   </ul>
              </nav>
            </div>
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
<!-- 환불 상세 모달 -->
<div class="modal fade" id="refundModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">환불 상세 정보</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>

      <form method="post" action="../admin/admin_refund_status.eum">
      <div class="modal-body">

        <!-- 숨겨진 값 (rf_id, page 값 전달용) -->
        <input type="hidden" name="rf_id" id="rf-id">
        <input type="hidden" name="page" value="${curpage}">

        <p><strong>환불 상태:</strong> 
          <select name="rf_status" id="rf-status-select" class="form-control">
            <option value="환불취소">환불취소</option>
            <option value="환불접수">환불접수</option>
            <option value="환불완료">환불완료</option>
          </select>
        </p>

        <p><strong>환불 금액:</strong> <span id="rf-amount"></span></p>
        <p><strong>환불 사유:</strong> <span id="rf-reason"></span></p>
        <p><strong>요청일:</strong> <span id="rf-requested"></span></p>
        <p><strong>완료일:</strong> <span id="rf-completed"></span></p>

      </div>

      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">변경 저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
      </form>

    </div>
  </div>
</div>


<script>
$(document).on("click", ".btn-refund", function () {

    $("#rf-id").val($(this).data("rfid"));               // 환불 ID
    $("#rf-reason").text($(this).data("reason"));        // 사유
    $("#rf-amount").text($(this).data("amount"));        // 금액
    $("#rf-requested").text($(this).data("requested"));  // 요청일
    $("#rf-completed").text($(this).data("completed"));  // 완료일

    const status = $(this).data("status");               // 현재 상태
    $("#rf-status").text(status);
    $("#rf-status-select").val(status);                  // 드롭다운 선택

    $("#refundModal").modal("show");
});

</script>
