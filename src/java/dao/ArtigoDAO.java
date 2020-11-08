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
}
