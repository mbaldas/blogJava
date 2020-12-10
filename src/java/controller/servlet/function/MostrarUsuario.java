package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import java.util.List;
import model.UsuarioModel;

public class MostrarUsuario implements MiddlewareInterface {
    
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioModel usuario = new UsuarioModel().listById(id);
        request.setAttribute("idDoUser", id);
        request.setAttribute("usuario", usuario);
        return "/AlterarUsuario.jsp";
    }
}
