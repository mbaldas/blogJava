/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MiddlewareServlet")
public class MiddlewareServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MiddlewareServlet() {
        super();
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) {
        String parametro = request.getParameter("middleware");
        String nomeDaClasse = "controller.servlet.function." + parametro;
	    
        try {
                Class classe = Class.forName(nomeDaClasse);
                MiddlewareInterface middleware = (MiddlewareInterface) classe.newInstance();

                // Recebe o String apos a execucaoo da logica
                String pagina = middleware.executa(request, response);

                // Faz o forward para a pagina JSP
                request.getRequestDispatcher(pagina).forward(request, response);
        } catch (ClassNotFoundException e) {
                e.printStackTrace();
        } catch (InstantiationException e) {
                e.printStackTrace();
        } catch (IllegalAccessException e) {
                e.printStackTrace();
        } catch (Exception e) {
                e.printStackTrace();
        }
    }
}
