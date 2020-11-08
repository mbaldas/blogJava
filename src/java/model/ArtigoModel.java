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
    private int id_usuario;
    private int id_categoria;
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
        return id_usuario;
    }
    
    public void setIdUsuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public int getIdCategoria() {
        return id_categoria;
    }
    
    public void setIdCategoria(int id_categoria) {
        this.id_categoria = id_categoria;
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
    
    public void insertUsuarioModel() throws SQLException {
        new ArtigoDAO().insertArtigoDAO(this);
    }
}
