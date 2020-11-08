package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import dao.connection.ConnectionDatabase;
import model.UsuarioModel;

public class UsuarioDAO {
    public void insertUsuarioDAO(UsuarioModel usuario) {
        Connection connection = null;
	PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("INSERT INTO usuario (email, senha, nome, cpf, papel, cadastro_aprovado) VALUES (?, ?, ?, ? ,?, ?)");
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getSenha());
            stmt.setString(3, usuario.getNome());
            stmt.setString(4, usuario.getCpf());
            stmt.setInt(5, usuario.getPapel());
            stmt.setString(6, usuario.getCadastroAprovado());
            stmt.execute();
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao registrar curso DAO: " + e.getMessage());
        }
        finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public List<UsuarioModel> listAllUsuariosDAO() {
	Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<UsuarioModel> usuarios = new ArrayList<>();
        UsuarioModel usuario = null;
        
        try {
        connection = new ConnectionDatabase().getConnection();
        stmt = connection.prepareStatement("SELECT * FROM usuario");
        rs = stmt.executeQuery();
            
        while(rs.next()) {
            usuario = new UsuarioModel();
            usuario.setId(rs.getInt("id"));
            usuario.setEmail(rs.getString("email"));
            usuario.setSenha(rs.getString("senha"));
            usuario.setNome(rs.getString("nome"));
            usuario.setCpf(rs.getString("cpf"));
            usuario.setPapel(rs.getInt("papel"));
            usuario.setCadastroAprovado(rs.getString("cadastro_aprovado"));
            usuarios.add(usuario);
        }        	
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar todos os usuarios: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt, rs);
        }
        return usuarios;
    }
  
    public void deletarUsuarioDAO(int id) {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("DELETE FROM usuario WHERE id = " + id);
            stmt.execute();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error ao deletar usuario: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public void aceitarUsuarioDAO(int id) {
        Connection connection = null;
        PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("UPDATE usuario SET cadastro_aprovado = ? WHERE id = " + id);
            stmt.setString(1, "S");
            stmt.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error ao aceitar o usuario: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
}