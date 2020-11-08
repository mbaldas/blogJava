<%@page import="model.UsuarioModel"%>
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
          
            <div class="float-right mr-2 nav-container-log">
            <ul class="navbar-nav">
              <li class="nav-item">
              <a class="nav-link font-weight-bold px-3 navbar-text" href="#"><i class="fas fa-user"></i></a>
              </li>
              <li class="nav-item">
              <a class="nav-link font-weight-bold px-3 navbar-text" href="#"><i class="fas fa-sign-in-alt"></i></a>
              </li>
            </ul>
            </div>
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
                                <td>${ usuario.cpf }</td>
                                <td>${ usuario.papel }</td>
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
                        <th>Autor</th>
                        <th>Título da Postagem</th>
                        <th>Ações</th>
                      </tr>

                  </thead>
                  <tbody id="form-list-client-body">
                      <tr>
                          <td>Matheus Baldas</td>
                          <td>Construindo um jardim harmônico</td>
                          <td>
                            <a class="btn btn-default btn-sm "> <i class="fas fa-check text-success"></i> </a>  
                            <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                          </td>
                      </tr>
                      <tr>
                        <td>Leonardo Carvalho</td>
                        <td>Como cuidar de seu Bonsai</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-check text-success"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                      <tr>
                        <td>Guilherme Alex</td>
                        <td>Adubando plantas frutíferas</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-check text-success"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                      <tr>
                        <td>Enzo Fiuza</td>
                        <td>Fotossíntese em períodos de inverno</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-check text-success"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                  </tbody>
              </table>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="headingThree">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  <span class="fontSecular" style="color: black;">CRUD Comentários</span>
                </button>
              </h5>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
              <div class="card-body">
                <table class="table">
                  <thead>
                      <tr>
                        <th>Conteúdo do comentário</th>
                        <th>Título da postagem</th>
                        <th>Autor</th>
                        <th>Ações</th>
                      </tr>

                  </thead>
                  <tbody id="form-list-client-body">
                      <tr>
                          <td>Amei, já quero fazer!</td>
                          <td>A arte de cultivar uma planta</td>
                          <td>Matheus Baldas</td>
                          <td>
                            <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                            <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                            <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                          </td>
                      </tr>
                      <tr>
                        <td>Aqui sempre falta água...</td>
                        <td>A importância da irrigação regular</td>
                        <td>João Augusto</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                      <tr>
                        <td>Fiz aqui em casa há alguns anos e ficou ótimo!</td>
                        <td>Como aproveitar a água da chuva em seu jardim</td>
                        <td>Douglas Gomes</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                      <tr>
                        <td>Sensacional, gostei muito. Vocês arrasam!</td>
                        <td>Como construir um deck</td>
                        <td>Joana Abreu</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                  </tbody>
              </table>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="headingFour">
              <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                  <span class="fontSecular" style="color: black;">CRUD postagens</span>
                </button>
              </h5>
            </div>
            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
              <div class="card-body">
                <table class="table">
                  <thead>
                      <tr>
                        <th>Autor</th>
                        <th>Título da postagem</th>
                        <th>Ações</th>
                      </tr>

                  </thead>
                  <tbody id="form-list-client-body">
                      <tr>
                          <td>Roberto Carlos</td>
                          <td>Jogando bola no jardim</td>
                          <td>
                            <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                            <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a> 
                            <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                              </td>
                      </tr>
                      <tr>
                        <td>William Bonner</td>
                        <td>Noticiando novas espécies de plantas</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                      <tr>
                        <td>Marcos Pontes</td>
                        <td>Plantando no espaço</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
                      <tr>
                        <td>Felipe Neto</td>
                        <td>Enchi o jardim de minhocas e veja no que deu</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                      </tr>
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
                          <th>CPF</th>
                          <th>Função</th>
                          <th>Ações</th>
                      </tr>

                  </thead>
                  <tbody id="form-list-client-body">
                      <tr>
                          <td>10573642383</td>
                          <td>Comentarista</td>
                          <td>
                            <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                            <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                            <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                          </td>
                      </tr>
                      <tr>
                        <td>10573642384</td>
                        <td>Autor</td>
                        <td>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                        </td>
                    </tr>
                    <tr>
                      <td>10573642385</td>
                      <td>Administrador</td>
                      <td>
                        <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                          <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                          <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                      </td>
                  </tr>
                  <tr>
                    <td>10573642386</td>
                    <td>Comentarista</td>
                    <td>
                      <a class="btn btn-default btn-sm "> <i class="fas fa-plus text-primary"></i> </a>
                      <a class="btn btn-default btn-sm "> <i class="fas fa-edit text-primary"></i> </a>  
                      <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
                    </td>
                </tr>
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
