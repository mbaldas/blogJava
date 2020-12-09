package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import dao.connection.ConnectionDatabase;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.ComentarioModel;

public class ComentarioDAO {
    public void insertComentarioDAO(ComentarioModel comentario) {
        Connection connection = null;
	PreparedStatement stmt = null;
        
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("INSERT INTO comentario (comentario, id_artigo, id_usuario) VALUES (?, ?, ?)");
            stmt.setString(1, comentario.getComentario());
            stmt.setInt(2, comentario.getIdArtigo());
            stmt.setInt(3, comentario.getIdUsuario());
            stmt.execute();
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao registrar comentario DAO: " + e.getMessage());
        }
        finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
    }
    
    public ComentarioModel listByIdArtigo(int id) {
	Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ComentarioModel comentario = null;
		
        try {
            connection = new ConnectionDatabase().getConnection();
            stmt = connection.prepareStatement("SELECT * FROM comentario WHERE id_artigo = " + id);
            rs = stmt.executeQuery();
            if(rs.next()) {
                comentario = new ComentarioModel();
                comentario.setId(rs.getInt("id"));
                comentario.setIdUsuario(rs.getInt("id_usuario"));
                comentario.setIdArtigo(rs.getInt("id_artigo"));
                comentario.setComentario(rs.getString("comentario"));
            }
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar comentario pelo ID: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt);
        }
        
        return comentario;
    }

}
