<%@ page import="kz.bitlab.javaee.db.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task </title>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>

<%@include file="navbar.jsp"%>

<%Task task = (Task) request.getAttribute("task");
    if(task!=null){
        %>
<div class="container">
   <form action="/details" method="post">
       <input type="hidden" class="mt-3 form-control" name='id' value="<%=task.getId()%>">
       <br>
       <span>Наименование: </span><input name="name" class="mt-3 form-control" type='text' value="<%=task.getName()%>">
       <br>
       <span>Описание: </span><textarea name="description" class="mt-3 form-control" type='text'><%=task.getDescription()%></textarea>
       <br>
       <span>Крайний срок: </span><input name="date" class="mt-3 form-control" type='date' value="<%=task.getDeadlineDate()%>">
       <br>
       <span>Выолнено: </span><br>
       <select name="status">
           <option>Да</option>
           <option selected value="Нет">Нет</option>
       </select>
       <br>
       <button class="btn btn-success mt-3" name="button" value="save">Сохранить</button>
       <button class="btn btn-danger mt-3" name="button" value="delete">Удалить</button>
   </form>
</div>
<%
    }
%>

<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>
