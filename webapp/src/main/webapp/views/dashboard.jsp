<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Computer Database</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/font-awesome.css" rel="stylesheet" media="screen">
<link href="./css/main.css" rel="stylesheet" media="screen">
</head>
<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" href="dashboard?page=1"> Application - Computer Database </a>
        </div>
    </header>

    <section id="main">
        <div class="container">
            <h1 id="homeTitle">
                ${nbComputer} <spring:message code="dashboard.computers_found"/>
            </h1>
            <div id="actions" class="form-horizontal">
                <div class="pull-left">
                    <form id="searchForm" action="dashboard?action=search" method="POST" class="form-inline">

                        <input type="search" id="searchbox" name="search" class="form-control" placeholder="Search name" />
                        <input type="submit" id="searchsubmit" value="Filter by name"
                        class="btn btn-primary" />
                    </form>
                </div>
                <div class="pull-right">
                    <a class="btn btn-success" id="addComputer" href="addComputer">Add Computer</a> 
                    <a class="btn btn-default" id="editComputer" href="#" onclick="$.fn.toggleEditMode();">Edit</a>
                </div>
            </div>
        </div>

        <form id="deleteForm" action="#" method="POST">
            <input type="hidden" name="selection" value="">
        </form>
        
        <form id="deleteCompanyForm" action="dashboard?action=deleteCompany" method="POST">
            <input type="hidden" name="selectionCompany" value="">
        </form>

        <div class="container" style="margin-top: 10px;">
			<div class="editMode">
				<select id="companyId" name="companyId">
					<c:forEach items="${companies}" var="company">
						<c:choose>
							<c:when test="${company.name == computer.company}">
								<option value="${company.id}" selected>${company.name}</option>
							</c:when>
							<c:otherwise>
								<option value="${company.id}">${company.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<a href="#" id="deleteCompanyForm" onclick="$.fn.deleteSelectedCompany();">
					<i style="color:green" class="fa fa-trash-o fa-lg"></i>
				</a>
			</div>
			<table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <!-- Variable declarations for passing labels as parameters -->
                        <!-- Table header for Computer Name -->

                        <th class="editMode" style="width: 60px; height: 22px;">
                            <input type="checkbox" id="selectall" /> 
                            <span style="vertical-align: top;">
                                 -  <a href="#" id="deleteSelected" onclick="$.fn.deleteSelected();">
                                        <i class="fa fa-trash-o fa-lg"></i>
                                    </a>
                            </span>
                        </th>
                        <th>
                            Computer name
                        </th>
                        <th>
                            Introduced date
                        </th>
                        <!-- Table header for Discontinued Date -->
                        <th>
                            Discontinued date
                        </th>
                        <!-- Table header for Company -->
                        <th>
                            Company
                        </th>

                    </tr>
                </thead>
                <!-- Browse attribute computers -->
                	<c:forEach items="${computerDtoList}" var="computer">
                		<tr>
	                        <td class="editMode">
	                            <input type="checkbox" name="cb" class="cb" value="${computer.id}">
	                        </td>
	                        <td>
	                            <a href="editComputer?id=${computer.id}" onclick="">${computer.name}</a>
	                        </td>
	                        <td>${computer.introduced}</td>
	                        <td>${computer.discontinued}</td>
	                        <td>${computer.company}</td>
	                    </tr>
                	</c:forEach>
                
                </tbody>
            </table>
        </div>
    </section>

    <footer class="navbar-fixed-bottom">
    	<div class="btn-group btn-group-sm pull-right" role="group" >
	        <a href="dashboard?page=1&length=10"><button type="button" class="btn btn-default">10</button></a>
	        <a href="dashboard?page=1&length=50"><button type="button" class="btn btn-default">50</button></a>
            <a href="dashboard?page=1&length=100"><button type="button" class="btn btn-default">100</button></a>
        </div>
        <div class="container text-center">
            <ul class="pagination">
                <li>
                    <a href="dashboard?page=${currentNbPage - 1}" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
	                  </a>
	              </li>
	               <c:choose>
	               	<c:when test="${currentNbPage < 4}">
	               		<c:forEach var="i" begin="1" end="5">
			              	<li><a href="dashboard?page=${i}">${i}</a></li>
			              </c:forEach>
	               	</c:when>
	               	<c:when test="${currentNbPage < (nbPagination - 2)}">
	               		<c:forEach var="i" begin="${currentNbPage - 2}" end="${currentNbPage + 2}">
			              	<li><a href="dashboard?page=${i}">${i}</a></li>
			              </c:forEach>
	               	</c:when>
	               	<c:otherwise>
	               		<c:forEach var="i" begin="${nbPagination - 4}" end="${nbPagination}">
			              	<li><a href="dashboard?page=${i}">${i}</a></li>
			              </c:forEach>
	               	</c:otherwise>
	               </c:choose>
	              <li>
	                <a href="dashboard?page=${currentNbPage + 1}" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	            </li>
	        </ul>
		</div>
    </footer>
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/dashboard.js"></script>

</body>
</html>