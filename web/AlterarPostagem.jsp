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
            <title>BLOG - Página do Autor</title>
    </head>

    <body>
        <% if(session.getAttribute("autor") != null || session.getAttribute("administrador") != null) { %>
            <div class="container--autores">
                <h2 class="fontSecular mt-5">AlterarPost</h2>
                <form name="alterarpost" action="MiddlewareServlet" method="POST">
                    <div class="form-group">
                        <label for="titulo">Título</label>
                        <input  name="titulo" type="text" class="form-control" id="exampleFormControlInput1" value="${ artigo.titulo }">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Escolha a categoria</label>
                        <select class="form-control" id="exampleFormControlSelect1" name="categoria">
                            <c:forEach var="categoria" items="${ categorias }">
                                <option value="${ categoria.id }">${ categoria.descricao }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="conteudo">Conteúdo da postagem</label>
                        <textarea class="form-control" name="conteudo" id="exampleFormControlTextarea1" rows="3">"${ artigo.conteudo }"</textarea>
                    </div>

                    <input type="hidden" name="middleware" value="AlterarPostagem">
                    <input type="hidden" name="id" value="${ artigo.id }">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </form> 
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