package controller.servlet.function;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import model.UsuarioModel;
import model.ArtigoModel;

public class ListarUsuarios implements MiddlewareInterface {
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<UsuarioModel> usuarios = new UsuarioModel().listAllUsuariosModel();
        List<ArtigoModel> artigos = new ArtigoModel().listAllArtigosModel();
        request.setAttribute("artigos", artigos);
        request.setAttribute("usuarios", usuarios);
        return "./Admin.jsp";
    }
}
