package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import dao.connection.ConnectionDatabase;
import model.ArtigoModel;

public class ArtigoDAO {
    public void insertArtigoDAO(ArtigoModel artigo) {
        Connection connection = null;
	PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("INSERT INTO artigo (id_usuario, id_categoria, titulo, conteudo, liberar, aprovado) VALUES (?, ?, ?, ? ,?, ?)");
            stmt.setInt(1, artigo.getIdUsuario());
            stmt.setInt(2, artigo.getIdCategoria());
            stmt.setString(3, artigo.getTitulo());
            stmt.setString(4, artigo.getConteudo());
            stmt.setString(5, artigo.getLiberar());
            stmt.setString(6, artigo.getAprovado());
            stmt.execute();
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao registrar artigo DAO: " + e.getMessage());
        }
        finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public List<ArtigoModel> listAllArtigosDAO() {
	Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<ArtigoModel> artigos = new ArrayList<>();
        ArtigoModel artigo = null;
        
        try {
        connection = new ConnectionDatabase().getConnection();
        stmt = connection.prepareStatement("SELECT * FROM artigo");
        rs = stmt.executeQuery();
            
        while(rs.next()) {
            artigo = new ArtigoModel();
            artigo.setId(rs.getInt("id"));
            artigo.setIdUsuario(rs.getInt("id_usuario"));
            artigo.setIdCategoria(rs.getInt("id_categoria"));
            artigo.setTitulo(rs.getString("titulo"));
            artigo.setConteudo(rs.getString("conteudo"));
            artigo.setLiberar(rs.getString("liberar"));
            artigo.setAprovado(rs.getString("aprovado"));
            artigos.add(artigo);
        }        	
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar todas os artigos: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt, rs);
        }
        return artigos;
    }
    
    public void liberarArtigoDAO(int id) {
        Connection connection = null;
        PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("UPDATE artigo SET liberar = ? WHERE id = " + id);
            stmt.setString(1, "S");
            stmt.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error ao liberar artigo: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public void deletarArtigoDAO(int id) {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("DELETE FROM artigo WHERE id = " + id);
            stmt.execute();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error ao deletar artigo: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public ArtigoModel listArtigoByIdDAO(int id) {
	Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArtigoModel artigo = null;
		
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("SELECT * FROM artigo WHERE id = " + id);
            rs = stmt.executeQuery();
            if(rs.next()) {
                artigo = new ArtigoModel();
                artigo.setId(rs.getInt("id"));
                artigo.setIdUsuario(rs.getInt("id_usuario"));
                artigo.setIdCategoria(rs.getInt("id_categoria"));
                artigo.setTitulo(rs.getString("titulo"));
                artigo.setConteudo(rs.getString("conteudo"));
                artigo.setLiberar(rs.getString("liberar"));
                artigo.setAprovado(rs.getString("aprovado"));
            }
        } catch(SQLException e) {
        	JOptionPane.showMessageDialog(null, "Erro ao listar artigo pelo ID: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
        
        return artigo;
    }
    
    public void updateArtigoDAO(ArtigoModel artigo) {
	Connection connection = null;
        PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("UPDATE artigo SET id_usuario = ?, id_categoria = ?,  titulo = ?, conteudo = ?, liberar = ?, aprovado = ? WHERE id = ?");
            stmt.setInt(1, artigo.getIdUsuario());
            stmt.setInt(2, artigo.getIdCategoria());
            stmt.setString(3, artigo.getTitulo());
            stmt.setString(4, artigo.getConteudo());
            stmt.setString(5, artigo.getLiberar());
            stmt.setString(6, artigo.getAprovado());
            stmt.setInt(7, artigo.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
        	JOptionPane.showMessageDialog(null, "Erro ao atualizar artigo DAO: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public void aceitarArtigoDAO(int id) {
        Connection connection = null;
        PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("UPDATE artigo SET aprovado = ? WHERE id = " + id);
            stmt.setString(1, "S");
            stmt.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error ao aceitar o artigo: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public void desaprovarArtigoDAO(int id) {
        Connection connection = null;
        PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("UPDATE artigo SET aprovado = ? WHERE id = " + id);
            stmt.setString(1, "N");
            stmt.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error ao desaprovar artigo: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
}
