<%-- 
    Document   : nofication
    Created on : Feb 27, 2024, 9:08:45 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:if test="${nofication != null}">
        <script type="text/javascript">
            alert("${nofication}");
        </script>
    </c:if>
</body>
</html>
