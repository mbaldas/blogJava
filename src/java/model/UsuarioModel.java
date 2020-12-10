/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.SQLException;
import java.util.List;
import dao.UsuarioDAO;

/**
 *
 * @author Matheus
 */
public class UsuarioModel {
    private int id;
    private String nome;
    private String email;
    private String cpf;
    private String senha;
    private int papel;
    private String cadastroAprovado;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getCpf() {
        return cpf;
    }
    
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public String getSenha() {
        return senha;
    }
    
    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public int getPapel() {
        return papel;
    }
    
    public void setPapel(int papel) {
        this.papel = papel;
    }
    
    public String getCadastroAprovado() {
        return cadastroAprovado;
    }
    
    public void setCadastroAprovado(String cadastroAprovado) {
        this.cadastroAprovado = cadastroAprovado;
    }
    
    public void insertUsuarioModel() throws SQLException {
        new UsuarioDAO().insertUsuarioDAO(this);
    }
    
    public List<UsuarioModel> listAllUsuariosModel() {
        return new UsuarioDAO().listAllUsuariosDAO();
    }
    
    public void deletarUsuarioModel() {
        new UsuarioDAO().deletarUsuarioDAO(this.getId());
    }
    
    public void aceitarUsuarioModel() {
        new UsuarioDAO().aceitarUsuarioDAO(this.getId());
    }
    
    public UsuarioModel listById(int id) {
        this.setId(id);
        return new UsuarioDAO().listById(this.getId());
    }
    
    public void updateUsuarioModel() {
        new UsuarioDAO().updateUsuarioDAO(this);
    }
   
}
