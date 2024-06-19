<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
        <style>
            .line{
                color: red;
            }
        </style>
    
    </head>
    <body>
        <h1><%=request.getAttribute("action")%></h1>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <h3 class="line"><%=message%></h3>
        <%
            }
        %>
        <a href="<%=request.getAttribute("page")%>">Back</a><br/>
    </body>
</html>
