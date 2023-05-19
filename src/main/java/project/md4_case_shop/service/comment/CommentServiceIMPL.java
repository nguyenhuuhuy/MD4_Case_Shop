package project.md4_case_shop.service.comment;

import project.md4_case_shop.config.ConnectMySQL;
import project.md4_case_shop.model.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class CommentServiceIMPL implements ICommentService{
    private Connection connection = ConnectMySQL.getConnection();
    private final String INSERT_INTO_COMMENT = "INSERT INTO commentuser(userid,productid,comment,status) VALUES (?,?,?,?);";
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
}
