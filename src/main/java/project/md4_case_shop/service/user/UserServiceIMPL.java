package project.md4_case_shop.service.user;

import project.md4_case_shop.config.ConnectMySQL;
import project.md4_case_shop.model.Role;
import project.md4_case_shop.model.RoleName;
import project.md4_case_shop.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserServiceIMPL implements IUserService {
    private Connection connection = ConnectMySQL.getConnection();
    private final String LIST_USER = "SELECT * FROM user";
    private final String SELECT_ALL_USERNAME = "SELECT username FROM user;";
    private final String SELECT_ALL_EMAIL = "SELECT email FROM user;";
    private final String INSERT_INTO_USER = "INSERT INTO user(name, username, email, password,avatar) VALUES (?,?,?,?,?);";
    private final String INSERT_INTO_USER_ROLE = "INSERT INTO userrole(iduser, idrole) VALUES (?,?);";
    private final String SELECT_USER_LOGIN = "SELECT * FROM user where username=? AND password=? AND status=?;";
    private final String SELECT_ROLE_BY_USER_ID = "SELECT role.id,role.name FROM role INNER JOIN userrole ur on role.id = ur.idrole where iduser=?;";
    private final String UPDATE_AVATAR = "UPDATE user SET avatar=? WHERE id=?";
    private String UPDATE_USER = "update user set name = ?, username = ?, email = ?, password = ?, status = ?, avatar = ? where id = ?";
    private String FIND_ID = "select name,username,email,password,status,avatar from user where id = ?";
    private String REMOVE = "delete from user where id = ?";
    private String BLOCK_USER = "update user set status = ? where id = ?;";

    @Override
    public List<User> findAll() throws SQLException {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LIST_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String username = resultSet.getString("username");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String avatar = resultSet.getString("avatar");
                boolean status = resultSet.getBoolean("status");
                Set<Role> roleSet = findRoleByUserId(id);
                userList.add(new User(id, name, username, email, password, avatar, status, roleSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void save(User user) throws SQLException {
        try {
            connection.setAutoCommit(false);
            if (findById(user.getId()) == null) {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, user.getName());
                preparedStatement.setString(2, user.getUsername());
                preparedStatement.setString(3, user.getEmail());
                preparedStatement.setString(4, user.getPassword());
                preparedStatement.setString(5, user.getAvatar());
                preparedStatement.executeUpdate();
                int user_id = 0;
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                while (resultSet.next()) {
                    user_id = resultSet.getInt(1);
                }
                // user_id vs role_id vào bảng trung gian user_role
                PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_USER_ROLE);
                Set<Role> roleSet = user.getRoleSet();
                List<Role> roleList = new ArrayList<>(roleSet);
                List<Integer> listRoleId = new ArrayList<>();
                for (int i = 0; i < roleList.size(); i++) {
                    listRoleId.add(roleList.get(i).getId());
                }
                for (int i = 0; i < listRoleId.size(); i++) {
                    preparedStatement1.setInt(1, user_id);
                    preparedStatement1.setInt(2, listRoleId.get(i));
                    preparedStatement1.executeUpdate();
                }

            } else {
                PreparedStatement ps_updateUser = connection.prepareStatement(UPDATE_USER);
                ps_updateUser.setString(1,user.getName());
                ps_updateUser.setString(2,user.getUsername());
                ps_updateUser.setString(3,user.getEmail());
                ps_updateUser.setString(4,user.getPassword());
                ps_updateUser.setBoolean(5,user.isStatus());
                ps_updateUser.setString(6,user.getAvatar());
                ps_updateUser.setInt(7,user.getId());
                ps_updateUser.executeUpdate();
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User findById(int id) throws SQLException {
        User user = null;
        PreparedStatement preparedStatement = connection.prepareStatement(FIND_ID);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            String name = resultSet.getString("name");
            String username = resultSet.getString("username");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String avatar = resultSet.getString("avatar");
            boolean status = resultSet.getBoolean("status");
            Set<Role> roleSet = findRoleByUserId(id);
            user = new User(id, name, username, email, password, avatar, status, roleSet);
        }
        return user;
    }

    @Override
    public void deleteById(int id) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(REMOVE)
        ) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    @Override
    public List<User> findByName(String name) {
        return null;
    }

    @Override
    public boolean existedByUserName(String username) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERNAME);
            List<String> listUserName = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listUserName.add(resultSet.getString("username"));
            }
            for (int i = 0; i < listUserName.size(); i++) {
                if (username.equals(listUserName.get(i))) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean existedByEmail(String email) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMAIL);
            List<String> listUserName = new ArrayList<>();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listUserName.add(resultSet.getString("email"));
            }
            for (int i = 0; i < listUserName.size(); i++) {
                if (email.equals(listUserName.get(i))) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public User userLogin(String username, String password, boolean status) {
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_LOGIN);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setBoolean(3,status);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String avatar = resultSet.getString("avatar");
                Set<Role> roleSet = findRoleByUserId(id);
                user = new User(id, name, avatar, roleSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public Set<Role> findRoleByUserId(int user_id) {
        Set<Role> roleSet = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROLE_BY_USER_ID);
            preparedStatement.setInt(1, user_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                RoleName name = RoleName.valueOf(resultSet.getString("name"));
                roleSet.add(new Role(id, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roleSet;
    }

    @Override
    public void updateAvatar(String avatar, int id) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_AVATAR);
            preparedStatement.setString(1, avatar);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void blockUser(User user) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(BLOCK_USER);
            preparedStatement.setBoolean(1,!user.isStatus());
            preparedStatement.setInt(2,user.getId());
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //

}
