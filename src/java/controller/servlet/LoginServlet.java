package controller.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UsuarioModel;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }
    
    /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append(" ").append(request.getParameter("cpf"));
        response.getWriter().append(" ").append(request.getParameter("senha"));
    }
    
    /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        for(UsuarioModel usuario : new UsuarioModel().listAllUsuariosModel()) {
            if(usuario.getCpf().equals(cpf) && usuario.getSenha().equals(senha) && usuario.getCadastroAprovado().equals("S")) {
                HttpSession session = request.getSession();
                session.setAttribute("usuarioId", usuario.getId());
                session.setAttribute("nomeUsuario", usuario.getNome());
                RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }
    }
    
}
