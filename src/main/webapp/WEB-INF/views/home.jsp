<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
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
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<br>
<p>leapYearCheck is ${leapYearCheck }</p>
<br>
<p>month is ${month }</p>
<br>
<p>day is ${day }</p>

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

<div class="row">
	<div class="sect-time">
		<ul class="menu">
			<c:forEach var="tvo" items="${tvoArr }">
				<li class="box">
					<div class="movie-time">
						<div class="movie-info">
							${tvo.movieName }
						</div>
						<c:forEach var="i" items="${tvo.hallNumber }" varStatus="status">
							<div class="movie-hall">
								<div class="info-hall">
								${i }
								</div>
								<c:forEach var="j" items="${tvo.movieStartTime[status1.index] }">
									<span class="info-time">
										<c:forEach var="k" items="${j }" varStatus="status1">
											<button class="myBtn">
												${k }
											</button>
											<input hidden>
												${tvo.movieEndTime[status1.index][status2.index] }
											</input>
										</c:forEach>
									</span>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</li>
			</c:forEach>
		</ul>
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
								${i }
								</div>
								<c:forEach var="j" items="${tvo.movieStartTime[status1.index] }">
									<span class="info-time">
										<c:forEach var="k" items="${j }" varStatus="status1">
											<button class="myBtn">
												${k }
											</button>
											<input hidden>
												${tvo.movieEndTime[status1.index][status2.index] }
											</input>
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

<div id="test">

</div>

</div>
<script type="text/javascript" src="${appRoot }/resources/js/account.js"></script>
<script type="text/javascript">
$(function(){
	/*
	$("a.page-link").click(function(){
		let month = $(this).attr("data-month");
		let day = $(this).attr("data-day");
		console.log(month);
		console.log(day);
		let data = {month : month,
				day: day};
		console.log(data);
		$.ajax({
			url: "${appRoot}/main/movieTime",
			type: "post",
			data: JSON.stringify(data),
			contentType: "application/json",
			success:function(data){
				console.log(data);
				console.log(data[0]);
				console.log(data[0].hallNumber.length);
				console.log(data[0].movieTime[0]);
				let output = '';
				for(let i=0; i<data.length; i++){
					output += '';
					for(let j=0; j<data[i].hallNumber.length; j++){
						for(let k=0; k<data[i].movieTime[j].length; k++){
							console.log(data[i].movieName + " " + data[i].hallNumber[j] + " " + data[i].movieTime[j][k]);
						}
					}
				}
				
				/*
				$.each(data, function(i, t){
					console.log(i);
					console.log(t.hallNumber);
				});
				/*
				for(let i = 0; i<data.length; i++){
					for(let j = 0; j<${data[i].HallNumber.length}; j++ ){
						for(let k = 0; k<${data[i].MovieTime[j].length}; k++){
							console.log(data[i].getMovieName() + " " + data[i].getHallNumber()[j] + " " + data[i].getMovieTime()[j][k])
						}
					}
				}
				
			},
			error:function(){
				console.log("error");
			}
		})
	});
	*/
});
</script>
</body>



</html>
