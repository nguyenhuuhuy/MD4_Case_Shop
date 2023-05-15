package project.md4_case_shop.controller;

import project.md4_case_shop.model.Role;
import project.md4_case_shop.model.RoleName;
import project.md4_case_shop.model.User;
import project.md4_case_shop.service.role.IRoleService;
import project.md4_case_shop.service.role.RoleServiceIMPL;
import project.md4_case_shop.service.user.IUserService;
import project.md4_case_shop.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@WebServlet(value = "/user")
public class UserController extends HttpServlet {
    IUserService userService = new UserServiceIMPL();
    IRoleService roleService = new RoleServiceIMPL();
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
            case "avatar":
                showFormChangeAvatar(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
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
            case "avatar":
                actionUpdateAvatar(request,response);
                break;
        }
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

    private void actionRegister(HttpServletRequest request, HttpServletResponse response) {
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
            request.setAttribute("validate", "Tài khoản đã tồn tại");
            request.setAttribute("name", name);
            request.setAttribute("userName", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            showFormRegister(request, response);

        } else if (userService.existedByEmail(email)) {
            request.setAttribute("validate", "Email đã tồn tại");
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
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionLogin(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.userLogin(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userLogin", user);
            Set<Role> roleSet = user.getRoleSet();
            List<Role> roles = new ArrayList<>(roleSet);
            session.setAttribute("role",roles.get(0).getName());
            try {
                response.sendRedirect("index.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("validate", "Đăng nhập thất bại vui lòng kiểm tra lại mật khẩu và tài khoản đăng nhập");
            showFormLogin(request, response);
        }
    }

    private void logOut(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showFormChangeAvatar(HttpServletRequest request, HttpServletResponse response) {
    }

    private void actionUpdateAvatar(HttpServletRequest request, HttpServletResponse response) {
    }
}
