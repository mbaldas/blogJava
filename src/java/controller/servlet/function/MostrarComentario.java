package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.ArtigoModel;
import model.CategoriaModel;
import model.ComentarioModel;

public class MostrarComentario implements MiddlewareInterface {
    
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        int artigoId = Integer.parseInt(request.getParameter("artigoId"));
        ArtigoModel artigo = new ArtigoModel().listArtigoByIdModel(artigoId);
        ComentarioModel comentario = new ComentarioModel().listByIdArtigo(artigoId);
        List<CategoriaModel> categorias = new CategoriaModel().listAllCategoriasModel();
        HttpSession session = request.getSession();
        Object teste = session.getAttribute("usuarioId");
        int idDoUser = Integer.parseInt(teste.toString());
        request.setAttribute("artigo", artigo);
        request.setAttribute("comentario", comentario);
        request.setAttribute("id", id);
        request.setAttribute("idDoUser", idDoUser);
        request.setAttribute("categorias", categorias);


        return "/AlterarComentario.jsp";
    }
}
