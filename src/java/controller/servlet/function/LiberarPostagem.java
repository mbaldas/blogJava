package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.servlet.MiddlewareInterface;
import model.ArtigoModel;

public class LiberarPostagem implements MiddlewareInterface {

	@Override
	public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
            int id = Integer.parseInt(request.getParameter("id"));
            ArtigoModel artigo = new ArtigoModel();
            artigo.setId(id);
            artigo.liberarArtigoModel();
            
            return "/Index.jsp";
	}

}