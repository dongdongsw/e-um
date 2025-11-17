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
              </div>
              
              
              <!-- Table -->
              <table class="table border table-hover bg-white orders-table">

                <thead>
                  <tr role="row">
                    <th></th>
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
