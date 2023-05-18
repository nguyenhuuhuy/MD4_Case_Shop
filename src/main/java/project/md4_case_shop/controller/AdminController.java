package project.md4_case_shop.controller;

import project.md4_case_shop.model.Cart;
import project.md4_case_shop.model.CartStatus;
import project.md4_case_shop.service.cart.CartServiceIMPL;
import project.md4_case_shop.service.cart.ICartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = {"/admin"})
public class AdminController extends HttpServlet {
    ICartService cartService = new CartServiceIMPL();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                try {
                    showListOder(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void showListOder(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Cart> cartList = cartService.findCartByStatus(CartStatus.ORDERED);
        request.setAttribute("cartList", cartList);
        request.getRequestDispatcher("cart/manager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
