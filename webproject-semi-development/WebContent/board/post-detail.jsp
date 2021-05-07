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
	// 나라별 목록 게시판으로 이동
	function MoveCountryBoardList() {
		
	}

</script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">${pvo.countryVO.countryName} 게시판</h6>
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
					<th class="table-active">분류 </th>
					<td colspan="3">${pvo.catergory}</td>
					<th class="table-active">작성일</th>
					<td>${pvo.postTime}</td>
				</tr>
				<tr>
					<th class="table-active">제목</th>
					<td colspan="5">${pvo.postTitle}</td>
				</tr>
				<tr>
					<td colspan="6" class="cotentWrap">
					<pre>${pvo.postContent}</pre></td>
				</tr>
			</table>
			<div class="btnWrap">
				<!-- 모든 사용자는 목록 btn을 볼 수 있다. -->
				<button type="button" class="btn btn-outline-primary" onclick="MoveCountryBoardList()">
				<i class="fas fa-fw fa-pencil-alt"></i> 목록</button>
				<!-- 내가 쓴 글만 수정 삭제 가능 -->
				<c:if test="${requestScope.pvo.memberVO.id==sessionScope.mvo.id}">
					<button type="button" class="btn btn-outline-primary">
					<i class="fas fa-fw fa-pencil-alt"></i> 수정</button>
					<button type="button" class="btn btn-outline-primary">
					<i class="fas fa-fw fa-times"></i> 삭제</button>
				</c:if>
				
			</div>
		</div>
	</div>
</div>