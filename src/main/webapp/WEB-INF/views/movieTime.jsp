<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.box {
	list-style-type: none;
	float: left;
	outline: 1px dotted red;
}

.sect-time {
	border: 1px solid black;
	width: 100%;
}

.div-box {
	border: 1px solid black;
}
</style>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="sect-date">
			<nav aria-label="Page navigation example">
  				<ul class="pagination">
  					<c:forEach var="dateVO" items="${dateArr }">
  						<li class="page-item">
							<a class="page-link" href="${appRoot }/main/movieTime/${dateVO.month}/${dateVO.day}" id="date" data-month="${dateVO.month }" data-day="${dateVO.day}">
								<span>${dateVO.month}월</span>
								<strong>${dateVO.day }일</strong>
							</a>
						</li>
  					</c:forEach>
  				</ul>
			</nav>
		</div>	
	</div>
	<br>
	<div class="row">
	<div class="sect-time">
		<div class="div-menu">
			<c:forEach var="tvo" items="${tvoArr }">
				<div class="div-box">
					<div class="movie-time">
						<div class="movie-info">
							${tvo.movieName }
						</div>
						<c:forEach var="i" items="${tvo.hallNumber }" varStatus="status">
							<div class="movie-hall">
								<div class="info-hall">
								${i }관
								</div>
								<c:forEach var="j" items="${tvo.movieTime[status.index] }">
									<span class="info-time">
										<c:forEach var="k" items="${j }">
											<button>
												${k }
											</button>
										</c:forEach>
									</span>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
</div>
</body>
</html>