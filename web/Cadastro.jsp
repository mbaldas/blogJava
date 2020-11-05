<%-- 
    Document   : Cadastro
    Created on : 05/11/2020, 19:39:19
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
        <link rel="stylesheet" href="assets/style.css" />
    </head>
    <body>
    <div class="container--signup">
      <div class="left">
        <div class="container--left">
          <h1 class="fontSecular">Olá!</h1>
          <p class="fontSecular">Solicite seu acesso agora</p>
          <form id="form-cadastro" name="novo-usuario" action="MiddlewareServlet"method="POST">
            <input type="hidden" name="middleware" value="CriarNovoUsuario">
            <div class="form-group">
              <label for="inputCpf" class="fontSecular">CPF</label>
              <input
                class="form-control"
                id="inputCpf"
                aria-describedby="cpfHelp"
                placeholder="12345678912"
                name="cpf"
              />
              <small id="cpfHelp" class="form-text text-muted"
                >Digite apenas os números do CPF sem pontuações</small
              >
            </div>
            <div class="form-group">
              <label for="selectRole" class="fontSecular"
                >Escolha sua função</label
              >
              <select class="form-control" id="selectRole" name="funcao">
                <option>Administrador</option>
                <option>Comentarista</option>
                <option>Autor</option>
              </select>
            </div>
            <div class="form-group">
              <label for="inputPassword" class="fontSecular">Senha</label>
              <input
                type="password"
                class="form-control"
                id="inputPassword"
                placeholder="*******"
                name="senha"
              />
            </div>
            <button type="submit" class="btn btn-primary button--signup">
              SOLICITAR MEU ACESSO
            </button>
          </form>
        </div>
      </div>
      <div class="right">
        <div class="container--right">
          <p class="fontSecular">
            Se junte ao melhor blog brasileiro, quiçá até mundial, que fala sobre TUDO
          </p>
          <div class="col-lg-6 d-none d-lg-block container--right--image">
            <img
              src="assets/images/undraw_Content_re_33px.svg"
              alt=""
              class="img-fluid"
            />
          </div>
        </div>
      </div>
    </div>
    <script src="dependencies/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
    </body>
</html>
