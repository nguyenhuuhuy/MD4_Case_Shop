package project.md4_case_shop.controller;

import project.md4_case_shop.model.Product;
import project.md4_case_shop.model.Role;
import project.md4_case_shop.model.RoleName;
import project.md4_case_shop.model.User;
import project.md4_case_shop.service.product.IProductService;
import project.md4_case_shop.service.product.ProductServiceIMPL;
import project.md4_case_shop.service.role.IRoleService;
import project.md4_case_shop.service.role.RoleServiceIMPL;
import project.md4_case_shop.service.user.IUserService;
import project.md4_case_shop.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@WebServlet(value = "/user")
public class UserController extends HttpServlet {
    IUserService userService = new UserServiceIMPL();
    IRoleService roleService = new RoleServiceIMPL();
    IProductService productService = new ProductServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                showFormRegister(request, response);
                break;
            case "login":
                showFormLogin(request, response);
                break;
            case "logout":
                logOut(request, response);
                break;
            case "edit":
                try {
                    formEdit(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                formDelete(request, response);
                break;
            case "editUserLogin":
                try {
                    formEditUserLogin(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "block":
                try {
                    blockUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                try {
                    listUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }

    }

    // khóa tái khoản
    private void blockUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        User userLogin = getUserLogin(request);
        Set<Role> roleSetUserLogin = userLogin.getRoleSet();
        List<Role> roleListUserLogin = new ArrayList<>(roleSetUserLogin);
        Set<Role> roleSet = user.getRoleSet();
        List<Role> roles = new ArrayList<>(roleSet);
        if (roles.get(0).getName() == RoleName.ADMIN) {
            request.setAttribute("message", "YOU CAN'T LOCK THIS ACCOUNT");
            listUser(request, response);
        } else if (roles.get(0).getName() == roleListUserLogin.get(0).getName()) {
            request.setAttribute("message", "THIS ACCOUNT IS INVALID ");
            listUser(request, response);
        } else {
            userService.blockUser(user);
            listUser(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "register":
                    actionRegister(request, response);
                    break;
                case "login":
                    actionLogin(request, response);
                    break;
                case "edit":
                    actionEdit(request, response);
                    break;
                case "delete":
                    actionDelete(request, response);
                    break;
                case "editUserLogin":
                    actionEditUserLogin(request, response);
                    break;
                default:
                    listUser(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // trang chủ
    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/home/home.jsp");
        dispatcher.forward(request, response);
    }

    // Điều hướng tới trang register
    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/login/register.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // hiện danh sách user
    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        List<User> userList = userService.findAll();
        request.setAttribute("listUser", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // hien thong tin can sua
    private void formEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        User userEdit = userService.findById(id);
        request.setAttribute("userEdit", userEdit);
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    // sua user
    private void actionEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userService.findById(id);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        userService.save(user);
        request.setAttribute("message", "EDIT SUCCESS");
        listUser(request, response);
    }

    // hiện thông tin userLogin
    private void formEditUserLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        User userEditLogin = userService.findById(id);
        request.setAttribute("userEditLogin", userEditLogin);
        request.getRequestDispatcher("user/editUserLogin.jsp").forward(request, response);
    }

    private void actionEditUserLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession(false);
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("nameLogin");
        String email = request.getParameter("emailLogin");
        String avatar = request.getParameter("avatar");
        String password = request.getParameter("passwordLogin");
        User user = userService.findById(id);
        user.setName(name);
        user.setEmail(email);
        user.setAvatar(avatar);
        user.setPassword(password);
        userService.save(user);
        if (session.getAttribute("userLogin") != null) {
            session.setAttribute("userLogin", user);
        }
        home(request, response);
    }

    private void formDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);

        request.getRequestDispatcher("user/delete.jsp").forward(request, response);
    }

    private void actionDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (id == 1) {
            request.setAttribute("message", "CAN'T DELETE ADMIN");
            return;
        } else if (id == 2) {
            request.setAttribute("message", "CAN'T DELETE PM");
            return;
        } else {
            userService.deleteById(id);
            request.setAttribute("message", "DELETE SUCCESS");
        }
            listUser(request, response);
    }

    private void actionRegister(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "user";
        Set<String> strRole = new HashSet<>();
        strRole.add(role);
        Set<Role> roleSet = new HashSet<>();
        strRole.forEach(role1 -> {
            switch (role1) {
                case "admin":
                    roleSet.add(roleService.findByName(RoleName.ADMIN));
                    break;
                case "pm":
                    roleSet.add(roleService.findByName(RoleName.PM));
                    break;
                case "user":
                    roleSet.add(roleService.findByName(RoleName.USER));
                    break;
            }
        });
        if (userService.existedByUserName(username)) {
            request.setAttribute("validate", "Account already exists");
            request.setAttribute("name", name);
            request.setAttribute("userName", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            showFormRegister(request, response);

        } else if (userService.existedByEmail(email)) {
            request.setAttribute("validate", "Email already exists");
            request.setAttribute("name", name);
            request.setAttribute("userName", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            showFormRegister(request, response);
        } else {
            User user = new User(name, username, email, password, roleSet);
            userService.save(user);
            request.setAttribute("validate", "Register success!");

            try {
                response.sendRedirect("/user?action=login");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    // Điều hướng tới trang Login
    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/login/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // Đăng Nhập
    private void actionLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = false;
        User user = userService.userLogin(username, password, status);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userLogin", user);
            Set<Role> roleSet = user.getRoleSet();
            List<Role> roles = new ArrayList<>(roleSet);
            session.setAttribute("role", roles.get(0).getName());
            for (int i = 0; i < roles.size(); i++) {
                if (roles.get(i).getName() == RoleName.ADMIN || roles.get(i).getName() == RoleName.PM) {
                    try {
                        response.sendRedirect("/topOder");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                } else {
                    try {
                        response.sendRedirect("index.jsp");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        } else {
            request.setAttribute("validate", "Login failed, please check your password and login account");
            showFormLogin(request, response);
        }
    }

    // đăng xuất
    private void logOut(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session.getAttribute("userLogin") != null) {
            session.removeAttribute("userLogin");
            session.invalidate();
        }
        try {
            response.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private User getUserLogin(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("userLogin");
        return user;
    }
}
