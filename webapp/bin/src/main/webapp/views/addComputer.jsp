<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Computer Database</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/font-awesome.css" rel="stylesheet" media="screen">
<link href="./css/main.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<script src="./js/validation.js"></script>
</head>
<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" href="dashboard?page=1"> Application - Computer Database </a>
        </div>
    </header>

    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-8 col-xs-offset-2 box">
                    <h1>Add Computer</h1>
                    <form:form action="addComputer" method="POST" id="form" modelAttribute="computerDto">
                        <fieldset>
                            <div class="form-group">
                                <label for="computerName">Computer name  (at least 2 characters)</label>
                                <form:input path="name" type="text" class="form-control" id="computerName" name="computerName" placeholder="Computer name"/>
                                <form:errors path="name"/>
                            </div>
                            <div class="form-group">
                                <label for="introduced">Introduced date  (Format : dd/MM/yyyy)</label>
                                <form:input path="introduced" type="date" class="form-control" id="introduced" name="introduced" placeholder="Introduced date"/>
                                <form:errors path="introduced"/>
                            </div>
                            <div class="form-group">
                                <label for="discontinued">Discontinued date  (Format : dd/MM/yyyy)</label>
                                <form:input path="discontinued" type="date" class="form-control" id="discontinued" name="discontinued" placeholder="Discontinued date"/>
                                <form:errors path="discontinued"/>
                            </div>
                            <div class="form-group">
                                <label for="companyId">Company</label>
                                <form:select path="company" class="form-control" id="companyId" name="companyId">
                                    <c:forEach items="${companies}" var="company">
	                                    <c:choose>
	                                    	<c:when test="${company.name == computer.company}">
	                                    		<option selected>${company.name}</option>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<option>${company.name}</option>
	                                    	</c:otherwise>
	                                    </c:choose>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </fieldset>
                        <div class="actions pull-right">
                            <input type="submit" value="Add" class="btn btn-primary">
                            or
                            <a href="dashboard" class="btn btn-default">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>