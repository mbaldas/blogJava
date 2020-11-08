package controller.servlet.function;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import model.UsuarioModel;

public class ListarUsuarios implements MiddlewareInterface {
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<UsuarioModel> usuarios = new UsuarioModel().listAllUsuariosModel();
        request.setAttribute("usuarios", usuarios);
        return "./Admin.jsp";
    }
}
