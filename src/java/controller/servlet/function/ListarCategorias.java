package controller.servlet.function;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import model.CategoriaModel;

public class ListarCategorias implements MiddlewareInterface {
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<CategoriaModel> categorias = new CategoriaModel().listAllCategoriasModel();
        request.setAttribute("categorias", categorias);
        return "./Autor.jsp";
    }
}
