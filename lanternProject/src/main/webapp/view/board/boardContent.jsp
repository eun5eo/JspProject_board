<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<script type="text/javascript">
	function del() {
		var bdt = confirm("정말 삭제하시겠습니까?");
		if (bdt) location.href = "boardDelete.en?review_no=${board.review_no}";
		else alert("삭제가 취소되었습니다");
	};
	
	function reply_del(reply_no) {
		var rdt = confirm("정말 삭제하시겠습니까?");
		if (rdt) location.href = "replyDelete.en?review_no=${board.review_no}&reply_no="+reply_no;
		else alert("삭제가 취소되었습니다");
	}
	
</script>
</head>
<body>
	<!-- 게시글 불러오기 -->
	<table>
		<caption>게시글</caption>
		<tr><th width="50">제목</th>
				<td>${board.title }</td>
			<th width="50">
				<button>❤</button>
				</th><td>${board.likes }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.member_no }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.read_cnt }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.reg_date}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<pre>${board.content}</pre>
			</td>
		</tr>
	</table>
	
	<div align="center">
		<button onclick="location.href='boardUpdateForm.en?review_no=${board.review_no}&pageNum=${pageNum }'">수정</button>
		<button onclick="del()">삭제</button>
		<button onclick="location.href='boardList.en?pageNum=${pageNum }'">목록</button>
	</div>

	<!-- 댓글 -->
	<div>
		<form action="replyWrite.en" method="post">
			<input type="hidden" name="review_no" value="${board.review_no}">
			<input type="hidden" name="member_no" value="${board.member_no}">
			<input type="hidden" name="reply_no" value="${reply.reply_no }">
				<!-- 댓글 작성 -->
				<div class="container">
					<pre>
						<textarea name="rp_content" maxlength="300"
						rows="5" cols="80" style="background-color: transparent; color: white;"
						placeholder="댓글을 입력하세요. (최대 300자)" required="required"></textarea>
					</pre>
					<input type="submit" value="댓글 작성">
				</div>
		</form>
				<!-- 댓글 리스트 -->
		<div>
	 		<c:if test="${empty rp_list }">
				<div>
					작성된 댓글이 없습니다.
				</div>
			</c:if>

			<!-- 게시글 데이터가 있으면 -->
			<c:if test="${not empty rp_list }">
				<c:forEach var="reply" items="${rp_list }">
				<c:if test="${reply.rp_del == 'n' }">
				<table>
					<colgroup>
						<col width="10%" />
						<col width="64%" />
						<col width="10%" />
						<col width="3%" />
						<col width="3%" />
					</colgroup>
					<tr>		
						<th>
							${reply.member_no }
						</th>
						<th>
							${reply.rp_content }
						</th>
						<th>
							${reply.rp_reg_date }
						</th>
						<%-- <c:if test="${reply.member_no == 1 }"></c:if> --%>
						<th>
							<a>수정</a>
						</th>
						<th>
							<a onclick="reply_del(${reply.reply_no})">삭제</a>
						</th>
					</tr>
				</table>
				</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>