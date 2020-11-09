package controller.servlet.function;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import controller.servlet.MiddlewareInterface;
import model.ArtigoModel;

public class CriarNovaPostagem implements MiddlewareInterface {
 
    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Object teste = session.getAttribute("usuarioId");
        int usuario_id = Integer.parseInt(teste.toString());
        int categoria_id = Integer.parseInt(request.getParameter("categoria"));
        String titulo = request.getParameter("titulo");
        String conteudo = request.getParameter("conteudo");
        
        ArtigoModel artigo = new ArtigoModel();
        artigo.setIdUsuario(usuario_id);
        artigo.setIdCategoria(categoria_id);
        artigo.setTitulo(titulo);
        artigo.setConteudo(conteudo);
        artigo.setLiberar("N");
        artigo.setAprovado("N");
        
        artigo.insertArtigoModel();
     
        return "/Index.jsp";
    }
    
}
