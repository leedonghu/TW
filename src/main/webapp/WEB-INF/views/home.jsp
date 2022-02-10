<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

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
</div>
<br>
<p>leapYearCheck is ${leapYearCheck }</p>
<br>
<p>month is ${month }</p>
<br>
<p>day is ${day }</p>

<div class="row">
	<nav aria-label="Page navigation example">
  		<ul class="pagination">
  			<c:forEach var="dateVO" items="${dateArr }">
  				<li class="page-item">
					<a class="page-link" href="#">
						<span>${dateVO.month}월</span>
						<strong>${dateVO.day }일</strong>
					</a>
				</li>
  			</c:forEach>
  			<!-- 
			<li class="page-item">
				<a class="page-link" href="#">
					<span>${month }월</span>
					<strong>${day }일</strong>
				</a>
			</li>
   	 		<li class="page-item">
				<a class="page-link" href="#">
					<span>${month }월</span>
					<strong>${day +1}일</strong>
				</a>
			</li>
    		<li class="page-item">
				<a class="page-link" href="#">
					<span>${month }월</span>
					<strong>${day +2}일</strong>
				</a>
			</li>
    		<li class="page-item">
				<a class="page-link" href="#">
					<span>${month }월</span>
					<strong>${day +3}일</strong>
				</a>
			</li>
    		<li class="page-item">
				<a class="page-link" href="#">
					<span>${month }월</span>
					<strong>${day +4}일</strong>
				</a>
			</li>
  			 -->
  		</ul>
	</nav>
</div>

</body>



</html>
