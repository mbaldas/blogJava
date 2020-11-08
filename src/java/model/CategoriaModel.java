package model;
import dao.CategoriaDAO;
import java.sql.SQLException;
import java.util.List;

public class CategoriaModel {
    private int id;
    private String descricao;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getDescricao() {
        return descricao;
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    public List<CategoriaModel> listAllCategoriasModel() {
        return new CategoriaDAO().listAllCategoriasDAO();
    }
}
