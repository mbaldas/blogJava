package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import model.ComentarioModel;

public class DeletarComentario implements MiddlewareInterface {
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        ComentarioModel comentario = new ComentarioModel();
        comentario.setId(id);
        comentario.deletarComentarioModel();

        return "/Index.jsp";
    }
}
