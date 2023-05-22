package project.md4_case_shop.service.user;

import project.md4_case_shop.model.Role;
import project.md4_case_shop.model.User;
import project.md4_case_shop.service.IGenericService;

import java.util.Set;

public interface IUserService extends IGenericService<User> {
    boolean existedByUserName(String username);
    boolean existedByEmail(String email);
    User userLogin(String username, String password, boolean status);
    Set<Role> findRoleByUserId(int user_id);
    void blockUser(User user);

}
