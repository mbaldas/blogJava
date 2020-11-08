<%-- 
    Document   : Login
    Created on : 05/11/2020, 18:20:58
    Author     : Matheus
--%>

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
            <li class="nav-item">
              <a class="nav-link font-weight-bold px-3 navbar-text" href="./MiddlewareServlet?middleware=ListarUsuarios">ADMIN</a>
            </li>
          
            <li class="nav-item">
              <a class="nav-link font-weight-bold px-3 navbar-text" href="./Autor.jsp">ÁREA DO AUTOR</a>
            </li>

            <li class="nav-item">
              <a class="nav-link font-weight-bold px-3 navbar-text" href="./feed.html">FEED</a>
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
      <main class="section coral">
        <h2 class="fontSecular">Olá, Fulano, bem vindo ao nosso blog!</h2>
        <div class="card mt-3">
          <h5 class="card-header">Como cuidar das suas plantas</h5>
          <div class="card-body">
            <h5 class="card-title">Dolores de Freitas</h5>
            <p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Faça um comentário
            </button>
          </div>
        </div>
        <div class="card mt-3">
          <h5 class="card-header">Plantando no espaço</h5>
          <div class="card-body">
            <h5 class="card-title">Marcos Pontes</h5>
            <p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Faça um comentário
            </button>
          </div>
          <div class="card-footer" style="display: flex; flex-direction: row;">
            <p class="card-text" contenteditable="">
              Isto é um exemplo de um comentário que pode ser excluído e apagado.
            </p>
            <a class="btn btn-default btn-sm "> <i class="fas fa-times text-danger"></i> </a>
          </div>
        </div>
        <div class="card mt-3">
          <h5 class="card-header">Enchi o jardim de minhocas e veja no que deu</h5>
          <div class="card-body">
            <h5 class="card-title">Felipe Neto</h5>
            <p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Faça um comentário
            </button>
          </div>
        </div>
        <div class="card mt-3">
          <h5 class="card-header">Jogando bola no jardim</h5>
          <div class="card-body">
            <h5 class="card-title">Roberto Carlos</h5>
            <p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
		Faça um comentário
            </button>
          </div>
        </div>
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
