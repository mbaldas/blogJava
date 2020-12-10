<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <script src="dependencies/jquery-3.5.1.min.js"></script>
             <link
                rel="stylesheet"
                href="dependencies/bootstrap-4.5.2-dist/css/bootstrap.min.css"
            />
            <link rel="stylesheet" href="assets/style.css" />
            <link rel="stylesheet" href="dependencies/fontawesome-free-5.15.1-web/css/all.min.css">
            <title>BLOG - Alterar Usuario</title>
    </head>

    <body>
        <% if(session.getAttribute("administrador") != null) { %>
            <div class="container--autores">
                <h2 class="fontSecular mt-5">Alterar usuário</h2>
                <form id="form-cadastro" name="editusuario" action="MiddlewareServlet" method="POST">
                    <div class="form-group">
                        <label for="titulo">Nome</label>
                        <input  name="nome" type="text" class="form-control" id="exampleFormControlInput1" value="${ usuario.nome }">
                    </div>
                    <div class="form-group">
                        <label for="titulo">Email</label>
                        <input  name="email" type="text" class="form-control" id="exampleFormControlInput1" value="${ usuario.email }">
                    </div>
                    <div class="form-group">
                        <label for="titulo">Senha</label>
                        <input  name="senha" type="text" class="form-control" id="exampleFormControlInput1" value="${ usuario.senha }">
                    </div>
                    <div class="form-group">
                        <label for="titulo">CPF</label>
                        <input  name="cpf" type="text" class="form-control" id="exampleFormControlInput1" value="${ usuario.cpf }">
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="selectRole" name="papel">
                            <option value="0">Administrador</option>
                            <option value="1">Autor</option>
                            <option value="2">Comentarista</option>
                         </select>
                    </div>
                    
                    <input type="hidden" name="id" value="${ idDoUser }">
                    <input type="hidden" name="middleware" value="AlterarUsuario">
                    <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        <% } else { %>
            <h2 class="fontSecular"> VOCÊ NÃO TEM ACESSO A ESSA PÁGINA </h2>
        <% } %>
         <script src="dependencies/jquery-3.5.1.min.js"></script>
         <script src="dependencies/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
         <script src="dependencies/jquery-validation/dist/jquery.validate.min.js"></script>
         <script src="dependencies/validation-postagem.js"></script>
    </body>
</html>