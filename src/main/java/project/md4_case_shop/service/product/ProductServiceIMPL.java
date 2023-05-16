package project.md4_case_shop.service.product;

import project.md4_case_shop.config.ConnectMySQL;
import project.md4_case_shop.model.Category;
import project.md4_case_shop.model.Product;
import project.md4_case_shop.service.category.CategoryServiceIMPL;
import project.md4_case_shop.service.category.ICategoryService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductServiceIMPL implements IProductService{
    private Connection connection = ConnectMySQL.getConnection();
    private ICategoryService categoryService = new CategoryServiceIMPL();
    private static final String LIST_PRODUCT = "select * from product";
    private static final String CREATE_PRODUCT = "INSERT INTO product(name,idcart,price,img,quantity)values (?,?,?,?,?);";
    private static final String UPDATE_PRODUCT = "UPDATE product SET name=?,idcart=?,price=?,img=?,quantity=? where id=?;";
    private static final String PRODUCT_BY_ID = "SELECT * FROM product where id = ?";
    private static final String DELETE_PRODUCT = "DELETE FROM product WHERE id=?;";
    private static final String SEARCH_BY_CATE = "select * from product pr join category ca on pr.idcart = ca.id where ca.name  like ? or pr.name like ?; ";


    @Override
    public List<Product> findAll()  {
        List<Product> productList = new ArrayList<>();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(LIST_PRODUCT);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Category category = categoryService.findById(rs.getInt("idcart"));
//                String idCate = String.valueOf(categoryService.findById(id));
                Float price = rs.getFloat("price");
                String img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                Product product = new Product(id, name, category, price, img, quantity);
                productList.add(product);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

    @Override
    public void save(Product product){
        try {
            System.out.println(findById(product.getId()));
            if (findById(product.getId()) == null) {
                PreparedStatement preparedStatement = connection.prepareStatement(CREATE_PRODUCT);
                preparedStatement.setString(1, product.getName());
                preparedStatement.setInt(2, product.getIdCart());
                preparedStatement.setFloat(3, product.getPrice());
                preparedStatement.setString(4, product.getImage());
                preparedStatement.setInt(5, product.getQuantity());
                preparedStatement.executeUpdate();
            } else {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
                preparedStatement.setString(1, product.getName());
                preparedStatement.setInt(2, product.getIdCart());
                preparedStatement.setFloat(3, product.getPrice());
                preparedStatement.setString(4, product.getImage());
                preparedStatement.setInt(5, product.getQuantity());
                preparedStatement.setInt(6, product.getId());
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public Product findById(int id) {
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int idCate = resultSet.getInt("idcart");
                float price = resultSet.getFloat("price");
                String img = resultSet.getString("img");
                int quantity = resultSet.getInt("quantity");
                product = new Product(id, name, categoryService.findById(idCate), price, img, quantity);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Product> findByName(String name) {
        return null;
    }

    @Override
    public List<Product> findByCategoryAndByName(String categorySearch) {
        List<Product> categoryListSearch = new ArrayList<>();
        ICategoryService categoryService = new CategoryServiceIMPL();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_CATE);
            preparedStatement.setString(1, '%' + categorySearch + '%');
            preparedStatement.setString(2, '%' + categorySearch + '%');
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Category category = categoryService.findById(rs.getInt("idcart"));
                float price = rs.getFloat("price");
                String img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                Product product = new Product(id, name, category, price, img, quantity);
                categoryListSearch.add(product);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return categoryListSearch;
    }

}
