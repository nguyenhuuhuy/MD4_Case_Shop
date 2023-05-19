package project.md4_case_shop.service.comment;

import project.md4_case_shop.config.ConnectMySQL;
import project.md4_case_shop.model.Comment;
import project.md4_case_shop.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentServiceIMPL implements ICommentService{
    private Connection connection = ConnectMySQL.getConnection();
    private final String INSERT_INTO_COMMENT = "INSERT INTO commentuser(userid,productid,comment,status) VALUES (?,?,?,?);";
    private final String SELECT_LIST_BY_PRODUCT = "SELECT  user.name, user.avatar,c.id,c.userid,c.productid,c.comment,c.status from user join commentuser c on user.id = c.userid where productid = ?;";
    @Override
    public List<Comment> findAll() throws SQLException {

        return null;
    }

    @Override
    public void save(Comment comment) throws SQLException {
        connection.setAutoCommit(false);
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_COMMENT, Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setInt(1,comment.getUserId());
        preparedStatement.setInt(2,comment.getProductId());
        preparedStatement.setString(3,comment.getComment());
        preparedStatement.setBoolean(4,false);
        preparedStatement.executeUpdate();
        connection.commit();
    }

    @Override
    public Comment findById(int id) throws SQLException {
        return null;
    }

    @Override
    public void deleteById(int id) throws SQLException {

    }

    @Override
    public List<Comment> findByName(String name) {
        return null;
    }

    @Override
    public List<Comment> commentProduct(int productId) {
        List<Comment> commentListProduct = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LIST_BY_PRODUCT);
            preparedStatement.setInt(1,productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String avatar = resultSet.getString("avatar");
                int id = resultSet.getInt("id");
                int userId = resultSet.getInt("userid");
                int idProduct = resultSet.getInt("productid");
                String comment = resultSet.getString("comment");
                boolean status = resultSet.getBoolean("status");
                Comment commentProduct = new Comment(name,avatar,id,userId,idProduct,comment,status);
                commentListProduct.add(commentProduct);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return commentListProduct;
    }

}
