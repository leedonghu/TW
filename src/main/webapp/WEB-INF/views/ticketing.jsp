<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style type="text/css">
	.seat-container{
		text-align: center;
	}
</style>
</head>
<body>
<div class="container">
	success
	<i class="fa-solid fa-1"></i>
	<i class="fa-solid fa-couch fa-rotate-90"></i>
	<c:forEach var="i" begin="0" end="${lineSize }" items="${seatName }" varStatus="status">
		<div class="seat-container">
			<div class="line${i }">
				<div>line number ${i }</div>
				<c:choose>
					<c:when test="${lastSeat eq 0 }">
						<c:forEach begin="1" end="12" var= "j">
							<span id="${i  }${j}" class="seat"><i class="fa-solid fa-couch"></i></span>
						</c:forEach>
					</c:when>
					<c:when test="${lastSeat ne 0}">
						<c:choose>
							<c:when test="${status.index ne lineSize }">
								<c:forEach begin="1" end="12" var= "j">
									<span id="${i  }${j}" class="seat"><i class="fa-solid fa-couch"></i></span>
								</c:forEach>
							</c:when>
							<c:when test="${status.index eq lineSize }">
								<c:forEach begin="1" end="${lastSeat }" var= "j">
									<span id="${i  }${j}" class="seat"><i class="fa-solid fa-couch"></i></span>
								</c:forEach>
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>
			</div>		
		</div>
	</c:forEach>
</div>

<script type="text/javascript">
	let seatSize = ${lineSize} * 12;
	let lastSeat = ${lastSeat};
	let seat = document.querySelectorAll(".seat");
	console.log(seatSize);
	console.log(lastSeat);
	
	let clickFunction = function(){
		console.log(this.getAttribute("id"));
	}
	
	for(let i=0; i<seatSize+lastSeat; i++){
		seat[i].addEventListener("click",clickFunction);
	}
	
</script>
</body>
</html>