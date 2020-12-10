<%@page import="model.UsuarioModel"%>
<%@page import="model.ArtigoModel"%>
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
        <title>BLOG - Página do Admin</title>
    </head>
    <body>
    <div class="container--admin">
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
      <% if(session.getAttribute("administrador") != null) { %>
        <h2 class="fontSecular">
        Admin Dashboard
        </h2>
        <div id="accordion">
          <div class="card mt-5">
            <div class="card-header" id="headingOne">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                  <span class="fontSecular" style="color: black;">Autorizar usuários</span>
                </button>
              </h5>
            </div>
            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
              <div class="card-body">
                <table class="table">
                  <thead>
                      <tr>
                          <th>Nome</th>
                          <th>CPF</th>
                          <th>Função</th>
                          <th>Ações</th>
                      </tr>

                  </thead>
                  <tbody id="form-list-client-body">
                      <tbody id="form-list-client-body">
                      <c:forEach var="usuario" items="${ usuarios }">
                          <c:if test = "${usuario.cadastroAprovado == 'N'}">
                            <tr>
                                <td>${ usuario.nome }</td>
                                <td>${ usuario.cpf }</td>
                                <c:if test = "${usuario.papel == 0}">
                                    <td>Administrador</td>
                                </c:if>
                                <c:if test = "${usuario.papel == 1}">
                                    <td>Autor</td>
                                </c:if>
                                <c:if test = "${usuario.papel == 2}">
                                    <td>Comentarista</td>
                                </c:if>
                                <td>
                                  <a href="./MiddlewareServlet?middleware=AceitarUsuario&id=${ usuario.id }" class="btn btn-default btn-sm "> <i class="fas fa-check text-success"></i> </a>  
                                  <a href="./MiddlewareServlet?middleware=DeletarUsuario&id=${ usuario.id }" class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                                </td>
                            </tr>
                          </c:if>
                      </c:forEach>
                  </tbody>
              </table>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="headingTwo">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  <span class="fontSecular" style="color: black;">Autorizar postagens</span>
                </button>
              </h5>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
              <div class="card-body">
                <table class="table">
                  <thead>
                      <tr>
                        <th>Titulo</th>
                        <th>Conteudo</th>
                        <th>Ações</th>
                      </tr>

                  </thead>
                  <tbody id="form-list-client-body">
                      <c:forEach var="artigo" items="${ artigos }">
                        <c:if test = "${artigo.liberar == 'S'}">
                          <tr>
                            <td>${ artigo.titulo }</td>
                            <td>${ artigo.conteudo }</td>
                            <td>
                              <a href="./MiddlewareServlet?middleware=AceitarArtigo&id=${ artigo.id }" class="btn btn-default btn-sm "> <i class="fas fa-check text-success"></i> </a>  
                              <a href="./MiddlewareServlet?middleware=DeletarArtigo&id=${ artigo.id }" class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                            </td>
                          </tr>
                        </c:if>
                      </c:forEach>
                  </tbody>
              </table>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="headingFour">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                  <span class="fontSecular" style="color: black;">CRUD Postagens</span>
                </button>
              </h5>
            </div>
            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
              <div class="card-body">
                <table class="table">
                    <thead>
                            <tr>
                                <th scope="col">Título</th>
                                <th scope="col">Conteúdo</th>
                                <th scope="col">Ações</th>
                            </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="artigo" items="${ artigos }">
                            <tr>
                                <td>${ artigo.titulo }</td>

                                <td>${ artigo.conteudo }</td>
                                <td>
                                    <a href="./MiddlewareServlet?middleware=LiberarPostagem&id=${ artigo.id }" class="btn btn-default btn-sm "> <i class="fas fa-check text-success"></i> </a>
                                    <a href="./MiddlewareServlet?middleware=MostrarPostagem&id=${ artigo.id }"> <i class="fas fa-edit text-primary"></i> </a>  
                                    <a href="./MiddlewareServlet?middleware=DeletarPostagem&id=${ artigo.id }" class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="headingFive">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                  <span class="fontSecular" style="color: black;">CRUD usuários</span>
                </button>
              </h5>
            </div>
            <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
              <div class="card-body">
                <table class="table">
                  <thead>
                      <tr>
                          <th>Nome</th>
                          <th>CPF</th>
                          <th>Função</th>
                          <th>Ações</th>
                      </tr>

                  </thead>
                  <tbody id="form-list-client-body">
                      <tbody id="form-list-client-body">
                      <c:forEach var="usuario" items="${ usuarios }">
                            <tr>
                                <td>${ usuario.nome }</td>
                                <td>${ usuario.cpf }</td>
                                <c:if test = "${usuario.papel == 0}">
                                    <td>Administrador</td>
                                </c:if>
                                <c:if test = "${usuario.papel == 1}">
                                    <td>Autor</td>
                                </c:if>
                                <c:if test = "${usuario.papel == 2}">
                                    <td>Comentarista</td>
                                </c:if>
                                <td>
                                    <a href="./MiddlewareServlet?middleware=MostrarUsuario&id=${ usuario.id }"> <i class="fas fa-edit text-primary"></i> </a>  
                                  <a href="./MiddlewareServlet?middleware=DeletarUsuario&id=${ usuario.id }" class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                                </td>
                            </tr>
                      </c:forEach>
                  </tbody>
              </table>
              </div>
            </div>
          </div>
        </div>
      <% } else { %>
      <h2 class="fontSecular"> VOCÊ NÃO TEM ACESSO A ESSA PÁGINA </h2>
      <% } %>
    </div>
    <script src="dependencies/jquery-3.5.1.min.js"></script>
    <script src="dependencies/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
    </body>
</html>
