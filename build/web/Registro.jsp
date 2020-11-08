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
        <title>BLOG - Página de Registro</title>
        <link rel="stylesheet" href="dependencies/bootstrap-4.5.2-dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/style.css" />
    </head>
    <body>
    <div class="container--signup">
      <div class="left">
        <div class="container--left">
          <h1 class="fontSecular">Olá!</h1>
          <p class="fontSecular">Solicite seu acesso agora</p>
          <form id="form-cadastro" name="novousuario" action="MiddlewareServlet" method="POST">
            <input type="hidden" name="middleware" value="CriarNovoUsuario">
            <div class="form-group">
              <label for="cpf" class="fontSecular">CPF</label>
              <input
                class="form-control cpf"
                id="inputCpf"
                aria-describedby="cpfHelp"
                placeholder="12345678912"
                name="cpf"
              />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="teste@teste.com.br" name="email">
            </div>
            <div class="form-group">
                <label for="nome">Nome</label>
                <input class="form-control" id="exampleInputName" aria-describedby="nameHelp" placeholder="Seu Nome" name="nome">
            </div>
            <div class="form-group">
              <label for="papel" class="fontSecular"
                >Escolha sua função</label
              >
              <select class="form-control" id="selectRole" name="papel">
                <option value="0">Administrador</option>
                <option value="1">Autor</option>
                <option value="2">Comentarista</option>
              </select>
            </div>
            <div class="form-group">
              <label for="senha" class="fontSecular">Senha</label>
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
    <script src="dependencies/jquery-3.5.1.min.js"></script>
    <script src="dependencies/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
    <script src="dependencies/jquery.mask.min.js"></script>
    <script src="dependencies/masks.js"></script>
    <script src="dependencies/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="dependencies/validation-registro.js"></script>
    </body>
</html>
