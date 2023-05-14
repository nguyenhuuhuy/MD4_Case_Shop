package project.md4_case_shop.service.user;

import project.md4_case_shop.model.Role;
import project.md4_case_shop.model.User;

import java.util.Set;

public interface IUserService {
    boolean existedByUserName(String username);
    boolean existedByEmail(String email);
    void save(User user);
    User userLogin(String userName, String password);
    Set<Role> findRoleByUserId(int user_id);
    void updateAvatar(String avatar, int id);
}
