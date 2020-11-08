package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import dao.connection.ConnectionDatabase;
import model.CategoriaModel;


public class CategoriaDAO {
    public List<CategoriaModel> listAllCategoriasDAO() {
	Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<CategoriaModel> categorias = new ArrayList<>();
        CategoriaModel categoria = null;
        
        try {
        connection = new ConnectionDatabase().getConnection();
        stmt = connection.prepareStatement("SELECT * FROM categoria");
        rs = stmt.executeQuery();
            
        while(rs.next()) {
            categoria = new CategoriaModel();
            categoria.setId(rs.getInt("id"));
            categoria.setDescricao(rs.getString("descricao"));
            categorias.add(categoria);
        }        	
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar todas as categorias: " + e.getMessage());
        } finally {
            ConnectionDatabase.closeConnection(connection, stmt, rs);
        }
        return categorias;
    }
}
