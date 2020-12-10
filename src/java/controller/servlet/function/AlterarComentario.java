package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import javax.servlet.http.HttpSession;
import model.ComentarioModel;

public class AlterarComentario implements MiddlewareInterface {

	@Override
	public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
            HttpSession session = request.getSession();
            Object teste = session.getAttribute("usuarioId");
            int usuario_id = Integer.parseInt(teste.toString());
            int artigo_id = Integer.parseInt(request.getParameter("artigoId"));
            int comentario_id = Integer.parseInt(request.getParameter("comentarioId"));
            String comentario = request.getParameter("comentario");

            ComentarioModel comentarioModel = new ComentarioModel();
            comentarioModel.setId(comentario_id);
            comentarioModel.setIdUsuario(usuario_id);
            comentarioModel.setIdArtigo(artigo_id);
            comentarioModel.setComentario(comentario);
            
        
            comentarioModel.updateComentarioModel();
     
            return "/Index.jsp";
	}
}
