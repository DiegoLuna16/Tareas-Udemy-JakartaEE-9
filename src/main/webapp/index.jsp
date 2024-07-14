<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>

<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta CHARSET="UTF-8">
    <title>Formulario Tarea 2</title>
</head>
<body>
<h3>Formulario </h3>

<%
    if(errores != null && !errores.isEmpty()){
%>
<ul class="alert alert-danger mx-5 px-5">
    <% for (String error : errores.values()){%>
    <li><%=error%></li>
    <%}%>
</ul>
<%}%>

<div class="px-5">
<form action="/webapp-form-tarea2/crear" method="post">

    <div class="row mb-3">
        <label for="nombre" class="col-form-label col-sm-2">Nombre</label>
        <div class="col-sm-4">
            <input type="text" name="nombre" id="nombre" class="form-control" value="${param.nombre}">
        </div>
            <%
                if(errores != null && errores.containsKey("nombre")){
                    out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("nombre") + "</small>");
                }
            %>
    </div>

    <div class="row mb-3">
        <label for="precio" class="col-form-label col-sm-2">Precio</label>
        <div class="col-sm-4">
            <input type="text" name="precio" id="precio" class="form-control" value="${param.precio}">
        </div>
            <%
                if(errores != null && errores.containsKey("precio")){
                    out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("precio") + "</small>");
                }
            %>
    </div>

    <div class="row mb-3">
        <label for="fabricante" class="col-form-label col-sm-2">Fabricante</label>
        <div class="col-sm-4">
            <input type="text" name="fabricante" id="fabricante" class="form-control" value="${param.fabricante}">
        </div>
            <%
                if(errores != null && errores.containsKey("fabricante")){
                    out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("fabricante") + "</small>");
                }
            %>
    </div>

    <div class="row mb-3">
        <div>
            <input type="submit" value="Enviar" class="btn btn-primary">
        </div>

    </div>

</form>
</div>
</body>
</html>
