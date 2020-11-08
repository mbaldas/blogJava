<%@page import="model.CategoriaModel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
        <header>
            <nav class="navbar navbar-expand-md nav-bg-customized">
              <button type="button" class="navbar-toggler bg-light" data-toggle="collapse" data-target="#nav">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse justify-content-between" id="nav">
                <ul class="navbar-nav"> 
                <% if(session.getAttribute("administrador") != null) { %>
                    <li class="nav-item">
                      <a class="nav-link font-weight-bold px-3 navbar-text" href="./MiddlewareServlet?middleware=ListarUsuarios">ADMIN</a>
                    </li>
                <% } %>

                <% if(session.getAttribute("autor") != null) { %>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold px-3 navbar-text" href="./MiddlewareServlet?middleware=ListarCategorias">ÁREA DO AUTOR</a>
                    </li>
                <% } %>

                <li class="nav-item">
                  <a class="nav-link font-weight-bold px-3 navbar-text" href="./Index.jsp">FEED</a>
                </li>
                </ul>
              </div>
            </nav>
        </header>
        <% if(session.getAttribute("autor") != null) { %>
            <div class="container--autores">
                <h2 class="fontSecular">Minhas Postagens - Por enquanto mockadas, porque as postagens aprovadas não fazem parte do requisito para 2 entrega</h2>
                <table class="table">
                    <thead>
                            <tr>
                                <th scope="col">Título</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Conteúdo</th>
                                <th scope="col">Ações</th>
                            </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>Como criar sua planta</td>
                                <td>Jardinagem</td>
                                <td>Lorem ipsum dolor sit amet</td>
                                <td>
                                    <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                                    <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                                </td>
                            </tr>
                            <tr>
                                <td>Como ter uma vida mais saudável</td>
                                <td>Lifestyle</td>
                                <td>Lorem ipsum dolor sit amet</td>
                                <td>
                                    <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                                    <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                                </td>
                            </tr>
                            <tr>
                                <td>Se alimentando melhor, mesmo sem tempo</td>
                                <td>Alimentação</td>
                                <td>Lorem ipsum dolor sit amet</td>
                                <td>
                                    <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                                    <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                                </td>
                            </tr>
                    </tbody>
                </table>
                <h2 class="fontSecular">Novo Post</h2>
                <form id="form-postagem" name="novopost" action="MiddlewareServlet" method="POST">
                    <div class="form-group">
                        <label for="titulo">Título</label>
                        <input  name="titulo" type="text" class="form-control" id="exampleFormControlInput1">
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
                        <textarea class="form-control" name="conteudo" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>

                    <input type="hidden" name="middleware" value="CriarNovaPostagem">
                    <input type="hidden" name="usuarioid" value="${usuarioId}">
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
