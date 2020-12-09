/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.SQLException;
import java.util.List;
import dao.ComentarioDAO;

/**
 *
 * @author Matheus
 */
public class ComentarioModel {
    private int id;
    private int idUsuario;
    private int idArtigo;
    private String comentario;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getIdUsuario() {
        return idUsuario;
    }
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public int getIdArtigo() {
        return idArtigo;
    }
    
    public void setIdArtigo(int idArtigo) {
        this.idArtigo = idArtigo;
    }
    
    public String getComentario() {
        return comentario;
    }
    
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    
    public void insertComentarioModel() throws SQLException {
        new ComentarioDAO().insertComentarioDAO(this);
    }
    
    public ComentarioModel listByIdArtigo(int id) {
        this.setId(id);
        return new ComentarioDAO().listByIdArtigo(this.getId());
    }
    
    /*public List<ArtigoModel> listAllArtigosModel() {
        return new ArtigoDAO().listAllArtigosDAO();
    }
    
    public void deletarArtigoModel() {
        new ArtigoDAO().deletarArtigoDAO(this.getId());
    }
    
    public void updateArtigoModel() {
        new ArtigoDAO().updateArtigoDAO(this);
    }
    
    public void aceitarArtigoModel() {
        new ArtigoDAO().aceitarArtigoDAO(this.getId());
    }*/
}
