package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import javax.servlet.http.HttpSession;
import model.UsuarioModel;

public class AlterarUsuario implements MiddlewareInterface {

	@Override
	public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            int papel = Integer.parseInt(request.getParameter("papel"));
            int id = Integer.parseInt(request.getParameter("id"));

            UsuarioModel usuario = new UsuarioModel();
            usuario.setId(id);
            usuario.setCpf(cpf);
            usuario.setNome(nome);
            usuario.setEmail(email);
            usuario.setSenha(senha);
            usuario.setPapel(papel);
        
            usuario.updateUsuarioModel();
     
            return "/Index.jsp";
	}
}
