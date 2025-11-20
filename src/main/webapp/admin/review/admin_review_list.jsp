<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/admin-review.css">

	 <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <div class="col-md-12 my-2">
                  <div class="d-flex justify-content-between align-items-center mb-2">
	                <div class="page-header-custom">
					    <h2>Review_List</h2>
					    <p>등록된 모든 리뷰 정보를 확인할 수 있습니다.</p>
					</div>
				    <form class="form" method="get" action="admin_review_list.eum">
				        <button type="submit">
				            <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
				                <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
				                    stroke="currentColor"
				                    stroke-width="1.333"
				                    stroke-linecap="round"
				                    stroke-linejoin="round" />
				            </svg>
				        </button>
				
				        <input class="input"
				            type="text"
				            name="keyword"
				            placeholder="Search..."
				            value="${keyword}" />
				
				        <button type="reset" class="reset">
				            <svg xmlns="http://www.w3.org/2000/svg"
				                fill="none"
				                viewBox="0 0 24 24"
				                stroke="currentColor"
				                stroke-width="2">
				                <path stroke-linecap="round"
				                    stroke-linejoin="round"
				                    d="M6 18L18 6M6 6l12 12" />
				            </svg>
				        </button>
				    </form>
				</div>
                  <div class="card shadow">
                  
                    <div class="card-body">
                    
                      <div class="toolbar row mb-3">
                        <div class="col">
                          <div class="form-inline">
                            <div class="form-row">
                              <div class="form-group col-auto" >
								
                              </div>
                            </div>
                          </div>
                        </div>
                        
                      </div>
                      <!-- table -->
                      <table class="table table-borderless table-hover">
                        <thead>
                          <tr>
                            <th></th>
                            <th><strong>NO</strong></th>
                            <th><strong>리뷰 점수</strong></th>
                            <th><strong>종류</strong></th>
                            <th><strong>작성자</strong></th>
                            <th><strong>카테고리</strong></th>
                            <th class="w-25"><strong>content</strong></th>
                            <th><strong>작성일</strong></th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          <!-- 가데이터 -->
                          <c:forEach var="review_list" items="${review_list }">
                          <tr>
                            <td></td>
                            
                            <td>
                              <p class="mb-0 text-normal">${review_list.b_review_id }</p>
                            </td>
                            
                            <td>
                              <p class="mb-0 text-normal">⭐${review_list.b_review_score}</p>
                            </td>
                            
                             <td>
                             	<c:if test="${review_list.depth == 1}">
                             		<p class="mb-0 text-normal">리뷰</p>	
                             	</c:if>
                              	<c:if test="${review_list.depth == 2}">
                             		<p class="mb-0 text-normal">답글</p>	
                             	</c:if>
                            </td>
                            
                            <td>
	                             <p class="mb-0 text-normal">
	                             	<a class="btn-detail" style="cursor: pointer;"
									   data-id="${review_list.b_review_id}"
									   data-score="${review_list.b_review_score}"
									   data-content="${fn:replace(review_list.b_review_content, '"', '&quot;')}"
									   data-date="${review_list.b_review_createdat}">
									        ${review_list.uvo.u_nickname }
									</a>
								</p>
                            </td>
                            
							<td>
							  <p class="mb-0 text-normal">${review_list.bvo.b_type }</p>
							</td>
							
                            <td class="w-25">
							  <small class="text-normal">
							  	<a class="btn-detail" style="cursor: pointer;"
								   data-id="${review_list.b_review_id}"
								   data-score="${review_list.b_review_score}"
								   data-content="${fn:replace(review_list.b_review_content, '"', '&quot;')}"
								   data-date="${review_list.b_review_createdat}">
								    <c:choose>
								      <c:when test="${fn:length(review_list.b_review_content) > 30}">
								        ${fn:substring(review_list.b_review_content, 0, 30)}...
								      </c:when>
								      <c:otherwise>
								        ${review_list.b_review_content}
								      </c:otherwise>
								    </c:choose>
								</a>
							  </small>
							</td>

							
                            <td class="text-normal">
							  ${review_list.b_review_createdat}
							</td>
                            
                            <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-normal sr-only">Action</span>
                              </button>
                              <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item btn-detail"
								   data-id="${review_list.b_review_id}"
								   data-score="${review_list.b_review_score}"
								   data-content="${fn:replace(review_list.b_review_content, '"', '&quot;')}"
								   data-date="${review_list.b_review_createdat}">
								   리뷰 상세보기
								</a>
								
                                <a class="dropdown-item" href="../admin/admin_users_detail.eum?u_id=${review_list.u_id }">사용자 프로필</a>
                                <a class="dropdown-item" href="../admin/admin_seller_detail.eum?u_s_id=${review_list.u_s_id }">판매자 프로필</a>
                                <c:if test="">
                                	
                                </c:if>
                                <c:if test="${review_list.depth == 1}">
                             		<a class="dropdown-item" href="../admin/admin_review_delete.eum?page=${curpage }&keyword=${keyword}&b_review_id=${review_list.b_review_id}">리뷰삭제</a>	
                             	</c:if>
                              	<c:if test="${review_list.depth == 2}">
                             		<a class="dropdown-item" href="../admin/admin_review_replydelete.eum?page=${curpage }&keyword=${keyword}&b_review_id=${review_list.b_review_id}">답글삭제</a>
                             	</c:if>
                              </div>
                            </td>
                          </tr>
                          </c:forEach>
                          
                        </tbody>
                      </table>
                      <nav aria-label="Table Paging" class="mb-0 text-muted">
                        <ul class="pagination justify-content-end mb-0">
                        <c:if test="${startPage > 1 }">
                          <li class="page-item">
                          	<a class="page-link" href="../admin/admin_review_list.eum?page=${startPage-1 }&keyword=${keyword}">&lt;</a>
                          </li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage }" end="${endPage }">
                          <li class="page-item ${i==curpage?'active':'' }" >
                          	<a class="page-link" href="../admin/admin_review_list.eum?page=${i }&keyword=${keyword}">${i }</a>
                          </li>
                        </c:forEach>  
                        <c:if test="${endPage < totalpage }">
                          <li class="page-item">
                          <a class="page-link" href="../admin/admin_review_list.eum?page=${endPage+1 }&keyword=${keyword}">&gt;</a>
                          </li>
                        </c:if>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div> <!-- customized table -->
              </div> <!-- end section -->
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
  <!-- ================= 상세보기 모달 ================= -->
<div class="modal fade" id="reviewDetailModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">

    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">리뷰 상세보기</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>

      <div class="modal-body">
        <p><strong>리뷰 ID:</strong> <span id="modal-id"></span></p>
        <p><strong>점수:</strong> ⭐<span id="modal-score"></span></p>
        <p><strong>작성일:</strong> <span id="modal-date"></span></p>

        <hr>
        <p><strong>리뷰 내용</strong></p>
        <div id="modal-content" style="white-space: pre-wrap;"></div>

        <hr>
        <p><strong>리뷰 이미지</strong></p>
        <div id="modal-images"></div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>

        
<script>
    $(document).on("click", ".btn-detail", function(e) {
        e.preventDefault();

        const id = $(this).data("id");
        const score = $(this).data("score");
        const content = $(this).data("content");
        const date = $(this).data("date");

        $("#modal-id").text(id);
        $("#modal-score").text(score);
        $("#modal-date").text(date);
        $("#modal-content").text(content);

        $.ajax({
            url: "../admin/review_image_list.eum",
            data: { id: id },
            success: function(result){

                let arr = JSON.parse(result);

                let html = "";

                if(arr.length > 0 && arr.some(img => img.url && img.url.trim() !== "")){
                	arr.forEach(img => {
                	    console.log("개별 이미지 객체:", img);
                	    console.log("img.url:", img.url);
                	    console.log("img['url']:", img["url"]);

                	    html += `<img src="\${img.url}" width="120" class="mr-2 mb-2" style="border-radius:6px;">`;

                	});
                } else {
                    html = "<p class='text-muted'>이미지가 없습니다.</p>";
                }

                $("#modal-images").html(html);
            }
        });

        $("#reviewDetailModal").modal("show");
    });


    document.querySelector(".form .reset").addEventListener("click", function(e){
        e.preventDefault();   

        const input = document.querySelector(".input");
        input.value = "";
        input.focus();
    });
</script>
    