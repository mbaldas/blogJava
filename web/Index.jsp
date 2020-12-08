<%@ page import="model.ArtigoModel"%>
<%@ page import="model.UsuarioModel"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Blog</title>
        <link rel="stylesheet" href="dependencies/bootstrap-4.5.2-dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/style.css"/>
    </head>
    <body>
     <div class="parent">
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
            
            <% if(session.getAttribute("usuarioId") == null) { %>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold px-3 navbar-text" href="./Login.jsp">LOGIN</a>
                </li>
            <% } %>
            </ul>
          
          </div>
        </nav>
      </header>
      <main class="section coral">
        <h2 class="fontSecular">Olá, bem vindo ao nosso blog!</h2>
        
            <% for(ArtigoModel artigo : new ArtigoModel().listAllArtigosModel()) { 
                UsuarioModel usuario = new UsuarioModel().listById(artigo.getIdUsuario());
                String autorNome = usuario.getNome();
                Integer artigoId = artigo.getId();
                String artigoTitulo = artigo.getTitulo();
                String artigoConteudo = artigo.getConteudo();
            %>	 	
                <% if(1 == 1) { %>
                    <div class="card mt-3">
                        <h5 class="card-header"><%out.print(artigoTitulo); %></h5>
                            <div class="card-body">
                                <h5 class="card-title"><%out.print(autorNome); %></h5>
                                <p class="card-text"><%out.print(artigoConteudo); %></p>
                                <% if(session.getAttribute("comentarista") != null) { %>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                        Faça um comentário
                                    </button>
                                <% } %>
                            </div>
                    </div>
                <% } %>
            <%} %>	
      </main>
      <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">  
                    <h5 class="modal-title" id="exampleModalLongTitle">Comentário</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
                    </button>
		</div>
                <div class="modal-body">
                    <label for="exampleFormControlTextarea1">Conteúdo do comentário</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
                <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary">Salvar</button>
                </div>
            </div>
	</div>
      </div>
    </div>
     <script src="dependencies/jquery-3.5.1.min.js"></script>
     <script src="dependencies/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
    </body>
</html>
