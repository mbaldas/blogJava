/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.SQLException;
import java.util.List;
import dao.ArtigoDAO;

/**
 *
 * @author Matheus
 */
public class ArtigoModel {
    private int id;
    private int idUsuario;
    private int idCategoria;
    private String titulo;
    private String conteudo;
    private String liberar;
    private String aprovado;
    
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
    
    public int getIdCategoria() {
        return idCategoria;
    }
    
    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    public String getTitulo() {
        return titulo;
    }
    
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getConteudo() {
        return conteudo;
    }
    
    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }
    public String getLiberar() {
        return liberar;
    }
    
    public void setLiberar(String liberar) {
        this.liberar = liberar;
    }
    public String getAprovado() {
        return aprovado;
    }
    
    public void setAprovado(String aprovado) {
        this.aprovado = aprovado;
    }
    
    public void insertArtigoModel() throws SQLException {
        new ArtigoDAO().insertArtigoDAO(this);
    }
    
    public List<ArtigoModel> listAllArtigosModel() {
        return new ArtigoDAO().listAllArtigosDAO();
    }
    
    public void liberarArtigoModel() {
        new ArtigoDAO().liberarArtigoDAO(this.getId());
    }
    
    public void deletarArtigoModel() {
        new ArtigoDAO().deletarArtigoDAO(this.getId());
    }
    
    public ArtigoModel listArtigoByIdModel(int id) {
        this.setId(id);
        return new ArtigoDAO().listArtigoByIdDAO(this.getId());
    }
    
    public void updateArtigoModel() {
        new ArtigoDAO().updateArtigoDAO(this);
    }
    
    public void aceitarArtigoModel() {
        new ArtigoDAO().aceitarArtigoDAO(this.getId());
    }
    
    public void desaprovarArtigoModel() {
        new ArtigoDAO().desaprovarArtigoDAO(this.getId());
    }
}
