<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 
	post-update.jsp
	나라별 게시판 글 수정 jsp
	필요한것 : 
		카테고리(분류), 글제목, 글내용
 -->
<script>
	function MoveList() {
		alert("MoveForm");
	}

	function deletePost() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			document.deleteForm.submit();
		}
	}

	function updatePost() {
		if (confirm("게시글을 수정하시겠습니까?")) {
			document.updateForm.submit();
		}
	}
	function commentPost() {
		if (confirm("댓글을 등록하시겠습니까?")) {
			document.updateForm.submit();
		}

	}
</script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">${requestScope.countryName}
			게시판</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table mytable table-bordered">
				<colgroup>
					<col width="13%" />
					<col width="17%" />
					<col width="13%" />
					<col width="17%" />
					<col width="13%" />
					<col width="17%" />
				</colgroup>
				<tr>
					<th class="table-active">글번호</th>
					<td>${pvo.postNo}</td>
					<th class="table-active">조회수</th>
					<td>${pvo.hits}</td>
					<th class="table-active">작성자</th>
					<td>${pvo.memberVO.id}</td>
				</tr>
				<tr>
					<th class="table-active">분류</th>
					<td colspan="3">${pvo.catergory}</td>
					<th class="table-active">작성일</th>
					<td>${pvo.postTime}</td>
				</tr>
				<tr>
					<th class="table-active">제목</th>
					<td colspan="5">${pvo.postTitle}</td>
				</tr>
				<tr>
					<td colspan="6" class="cotentWrap"><pre>${pvo.postContent}</pre></td>
				</tr>
			</table>
			<div class="btnWrap">
				<!-- submit 을 위한 form -->
				<form name="MoveForm" action="" method="post">
					<input type="hidden" name="pageNo"
						value="${requestScope.pvo.postNo}">
				</form>
				<form name="deleteForm"
					action="${pageContext.request.contextPath}/DeletePostController.do"
					method="post">
					<input type="hidden" name="pageNo"
						value="${requestScope.pvo.postNo}">
				</form>
				<form name="updateForm"
					action="${pageContext.request.contextPath}/UpdatePostFormController.do"
					method="post">
					<input type="hidden" name="postNo"
						value="${requestScope.pvo.postNo}">
				</form>
				<!-- 모든 사용자는 목록 btn을 볼 수 있다. -->
				<button type="button" class="btn btn-outline-primary"
					onclick="MoveList()">
					<i class="fas fa-fw fa-pencil-alt"></i> 목록
				</button>
				<!-- 내가 쓴 글만 수정 삭제 가능 -->
				<c:if test="${requestScope.pvo.memberVO.id==sessionScope.mvo.id}">
					<button type="button" class="btn btn-outline-primary"
						onclick="updatePost()">
						<i class="fas fa-fw fa-pencil-alt"></i> 수정
					</button>
					<button type="button" class="btn btn-outline-primary"
						onclick="deletePost()">
						<i class="fas fa-fw fa-times"></i> 삭제
					</button>
				</c:if>
			</div>
			<hr>
			<!-- 댓글 리스트를 불러오기  -->
			<c:if test="${requestScope.commentList !=null}">
				<c:forEach var="comment" items="${requestScope.commentList}">
					<tr>
						<!-- ID, 작성날짜 -->
						<td width="150">
							<div>
								${comment.member_id}<br> <font size="2" color="lightgray">${comment.time_commented}</font>
							</div>
						</td>
						<!-- 본문내용 -->
						<td width="550">
							<div class="text_wrapper">${comment.content}</div>
						</td>
						<!-- 댓글 작성자만 수정 가능 -->
						<td width="100">
							<div id="btn" style="text-align: center;">
								<c:if
									test="${requestScope.pvo.memberVO.id==sessionScope.mvo.id}">
									<a href="#">[수정]</a>
									<br>
									<a href="#">[삭제]</a>
								</c:if>
							</div>
						</td>
					</tr>

				</c:forEach>
			</c:if>
			<!-- 로그인 시 댓글 작성 가능 -->
			<c:if test="${sessionScope.mvo!=null}">
				<div class="commentWrap">
					<form name="commentForm"
						action="${pageContext.request.contextPath}/WriteCommentFormController.do"
						method="post">
						<input type="hidden" name="postNo"
							value="${requestScope.pvo.postNo}"> 
						<input type="hidden"
							name="memberId" value="${sessionScope.mvo.id}">
					</form>
					<div>${sessionScope.mvo.id}</div>
					<div class="form-group">
						<label for="comment"></label>
						<textarea class="form-control" name="commentContent" rows="2"></textarea>
					</div>
					<div class="btnWrap">
						<!-- 댓글등록버튼 -->
						<button type="button" class="btn btn-outline-primary"
						onclick="commentPost()"><i class="fas fa-fw fa-pencil-alt"></i>등록</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>