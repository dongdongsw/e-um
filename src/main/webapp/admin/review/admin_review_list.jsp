<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
.avatar-md {
  width: 50px;
  height: 50px;
  overflow: hidden;
  border-radius: 50%;
}

.avatar-md .avatar-img {
  width: 100%;
  height: 100%;
  object-fit: cover;      
  border-radius: 50%;   
  display: block;
}

</style>
	 <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <!-- Small table -->
                <div class="col-md-12 my-2">
                  <h2 class="h4 mb-1">리뷰 리스트</h2>
                  <p class="mb-3"> </p>
                  <div class="card shadow">
                    <div class="card-body">
                      <div class="toolbar row mb-3">
                        <div class="col">
                          <form class="form-inline">
                            <div class="form-row">
                              <div class="form-group col-auto">
                                <label for="search" class="sr-only">Search</label>
                                <input type="text" class="form-control" id="search" value="" placeholder="Search">
                              </div>
                              <div class="form-group col-auto ml-3">
                                <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref">Status</label>
                                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                  <option selected>Choose...</option>
                                  <option value="1">Processing</option>
                                  <option value="2">Success</option>
                                  <option value="3">Pending</option>
                                  <option value="3">Hold</option>
                                </select>
                              </div>
                            </div>
                          </form>
                        </div>
                        <div class="col ml-auto">
                          <div class="dropdown float-right">
                            <button class="btn btn-primary float-right ml-3" type="button">Add more +</button>
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="actionMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button>
                            <div class="dropdown-menu" aria-labelledby="actionMenuButton">
                              <a class="dropdown-item" href="#">Export</a>
                              <a class="dropdown-item" href="#">Delete</a>
                              <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- table -->
                      <table class="table table-borderless table-hover">
                        <thead>
                          <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="all2">
                                <label class="custom-control-label" for="all2"></label>
                              </div>
                            </td>
                            <th>리뷰 KEY</th>
                            <th>리뷰 점수</th>
                            <th>작성자</th>
                            <th class="w-25">content</th>
                            <th>작성일</th>
                            <th></th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          <!-- 가데이터 -->
                          <c:forEach var="review_list" items="${review_list }">
                          <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="2474">
                                <label class="custom-control-label" for="2474"></label>
                              </div>
                            </td>
                            
                            <td>
                              <p class="mb-0 text-muted"><strong>${review_list.b_review_id }</strong></p>
                            </td>
                            
                            <td>
                              <p class="mb-0 text-muted">⭐${review_list.b_review_score}</p>
                            </td>
                            
                            <td>
                             <%--  <p class="mb-0 text-muted"><a href="#" class="text-muted">${review_list.usvo.u_s_com }</a></p> --%>
                            </td>
                            
                            <td class="w-25">
							  <small class="text-muted">
							  	<a class="dropdown-item btn-detail" style="cursor: pointer;"
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

                            <td class="text-muted">
							  <%-- <fmt:formatDate value=" --%>${review_list.b_review_createdat}<!-- " pattern="yyyy-MM-dd" /> -->
							</td>
                            <td>
							  <%-- <div class="form-group mb-3">
							    <select class="form-control" id="example-select">
							      <option value="active" ${review_list.b_status eq 'active' ? 'selected' : ''}>활성화</option>
							      <option value="inactive" ${review_list.b_status eq 'inactive' ? 'selected' : ''}>비활성화</option>
							    </select>
							  </div> --%>
							  <!-- 이미지가 있는지 테스트 용도 -->
							  <c:forEach var="img" items="${review_list.imageList}">
					            <span class="img-url">${img.r_image_url}</span>
					          </c:forEach>
							</td>

                            <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-muted sr-only">Action</span>
                              </button>
                              <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item btn-detail"
								   data-id="${review_list.b_review_id}"
								   data-score="${review_list.b_review_score}"
								   data-content="${fn:replace(review_list.b_review_content, '"', '&quot;')}"
								   data-date="${review_list.b_review_createdat}">
								   상세보기
								</a>

                                <a class="dropdown-item" href="#">삭제</a>
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
                          	<a class="page-link" href="../admin/admin_review_list.eum?page=${startPage-1 }">&lt;</a>
                          </li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage }" end="${endPage }">
                          <li class="page-item ${i==curpage?'active':'' }" >
                          	<a class="page-link" href="../admin/admin_review_list.eum?page=${i }">${i }</a>
                          </li>
                        </c:forEach>  
                        <c:if test="${endPage < totalpage }">
                          <li class="page-item">
                          <a class="page-link" href="../admin/admin_review_list.eum?page=${endPage+1 }">&gt;</a>
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
        <div id="modal-images"></div>   <!-- ★ 반드시 modal-body 안에 있어야 함 -->
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


</script>
    