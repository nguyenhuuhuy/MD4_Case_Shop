package project.md4_case_shop.service.role;

import project.md4_case_shop.model.Role;
import project.md4_case_shop.model.RoleName;

public interface IRoleService {
    Role findByName(RoleName name);
}
