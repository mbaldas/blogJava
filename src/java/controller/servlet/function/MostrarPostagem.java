package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.ArtigoModel;
import model.CategoriaModel;

public class MostrarPostagem implements MiddlewareInterface {
    
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CategoriaModel> categorias = new CategoriaModel().listAllCategoriasModel();
        ArtigoModel artigo = new ArtigoModel().listArtigoByIdModel(id);
        HttpSession session = request.getSession();
        Object teste = session.getAttribute("usuarioId");
        int idDoUser = Integer.parseInt(teste.toString());
        request.setAttribute("artigo", artigo);
        request.setAttribute("id", id);
        request.setAttribute("categorias", categorias);
        request.setAttribute("idDoUser", idDoUser);

        return "/AlterarPostagem.jsp";
    }
}
