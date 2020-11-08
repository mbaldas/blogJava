package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import model.UsuarioModel;

public class DeletarUsuario implements MiddlewareInterface {
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioModel usuario = new UsuarioModel();
        usuario.setId(id);
        usuario.deletarUsuarioModel();

        return "/Index.jsp";
    }
}
