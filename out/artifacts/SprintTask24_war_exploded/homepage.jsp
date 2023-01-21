<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.javaee.db.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task Manager</title>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container mb-3">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        + Добавить задание
    </button>

    <form action="/addtask" method="post">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Новое задание</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <span>Наименовани: </span><input class="mt-3 form-control" type='text' name='name'>
                        <br>
                        <span>Описание: </span><textarea class="mt-3 form-control" type='text' name='description'></textarea>
                        <br>
                        <span>Крайний срок: </span><input class="mt-3 form-control" type='date' name='date'>
                        <br>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal" name="button" value="close">Закрыть</button>
                        <button class="btn btn-primary" name="button" value="save">Сохранить</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>

<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Выполнено</th>
            <th scope="col">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
            for(Task task : tasks){
                %>
        <tr>
            <th scope="row"><%=task.getId()%></th>
            <td><%=task.getName()%></td>
            <td><%=task.getDeadlineDate()%></td>
            <td><%=task.getStatus()%></td>
            <td><a href="/details?id=<%=task.getId()%>" class="btn btn-primary btn-sm">DETAILS</a></td>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>
<script type="text/javascript" src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>
