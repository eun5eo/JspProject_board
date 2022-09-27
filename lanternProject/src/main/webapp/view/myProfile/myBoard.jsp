<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="../sessionChk.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myBookmarkList .dot").css("display", "block");
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
</script>
<style type="text/css">
nav { background: gray; height: 400px; float: left; width: 20%; }
table { background-color: #FAF0E6; width:  100%;	}
td { background-color:#FFFFE0; 		}
th { background: #228B22; 			}
td, th { padding: 12px; border: 1px solid green; }
article { background: pink; height: 400px; float: left; width: 80%; }
</style>
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		
		<nav><jsp:include page="profileMenu.jsp"></jsp:include></nav>
		<!-- 내용 -->
		<div class="container-table">
		<table>
			<tr>
				<th>글번호</th><th>제목</th><th>게시일자</th><th>조회수</th><th>좋아요 수</th><th>작성자</th><th>삭제여부</th><th>수정</th><th>삭제</th>
			</tr>
			<c:if test="${empty list} ">
				<tr><th colspan="10">데이터가 존재하지 않습니다</th></tr>
			</c:if>
				
			<c:if test="${not empty list }">
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${board.bno} </td>
						<td>${board.member_no} </td>
						<td>${board.title} </td>
						<td>${board.content} </td>
						<td>${board.reg_date} </td>
						<td>${board.read_cnt} </td>
						<td>${board.likes} </td>
						<td>${board.del} </td>
						<td><a href="../board/boardUpdateForm.do?bno=${board.bno}" class="btn btn_stroke btn_small">수정</a></td>
						<td><a onclick="del(${board.bno})" class="btn btn_small">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>		
		</table>
	</div>

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myBookmark.do?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/left-arrow.png">
							<img alt="이전" src="../../images/left-arrow.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myBookmark.do?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/left-arrow.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myBookmark.do?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myBookmark.do?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/right-arrow.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myBookmark.do?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../images/right-arrow.png">
							<img alt="다음" src="../../images/right-arrow.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>