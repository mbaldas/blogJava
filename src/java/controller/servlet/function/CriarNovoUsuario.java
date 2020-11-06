/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import model.UsuarioModel;

public class CriarNovoUsuario implements MiddlewareInterface {
    
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cpf = request.getParameter("cpf").replaceAll("[.-]", "");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        int papel = Integer.parseInt(request.getParameter("papel"));

        UsuarioModel usuario = new UsuarioModel();
        usuario.setCpf(cpf);
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(senha);
        usuario.setPapel(papel);
        usuario.setCadastroAprovado("N");
        
        usuario.insertUsuarioModel();

        return "/Login.jsp";
    }
}