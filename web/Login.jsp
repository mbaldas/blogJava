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
     <div class="container--signin">
      <div class="left--signin">
        <div class="container--left__signin">
          <p class="fontSecular">
            Passe na porta do login e tenha acesso ao mundo mágico!
          </p>
          <div class="col-lg-6 d-none d-lg-block container--right--image">
            <img
              src="assets/images/undraw_Login_re_4vu2.svg"
              alt=""
              class="img-fluid"
            />
          </div>
        </div>
      </div>
      <div class="right--signin">
        <div class="container--right__signin">
          <h1 class="fontSecular">Olá!</h1>
          <p class="fontSecular">Já se cadastrou? Entre agora no nosso blog</p>
          <form>
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
              FAZER LOGIN
            </button>
          </form>
          <p class="fontSecular" id="solicite">Ainda não solicitou seu acesso? Solicite <a href="./cadastro.html">já</a></p>
        </div>
      </div>
     </div>
     <script src="dependencies/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
    </body>
</html>
