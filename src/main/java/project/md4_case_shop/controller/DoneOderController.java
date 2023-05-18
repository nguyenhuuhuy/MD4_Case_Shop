package project.md4_case_shop.controller;


import project.md4_case_shop.model.Cart;
import project.md4_case_shop.model.CartStatus;
import project.md4_case_shop.model.Product;
import project.md4_case_shop.model.User;
import project.md4_case_shop.service.cart.CartServiceIMPL;
import project.md4_case_shop.service.cart.ICartService;
import project.md4_case_shop.service.product.IProductService;
import project.md4_case_shop.service.product.ProductServiceIMPL;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(value = {"/oderDone"})
public class DoneOderController extends HttpServlet {
    IProductService productService = new ProductServiceIMPL();
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
                    showListOderDone(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void showListOderDone(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Cart> cartList = cartService.findCartByStatus(CartStatus.DONE);
        float total = cartService.totalCart(cartList);
        request.setAttribute("cartList", cartList);
        request.setAttribute("totalDone", total);
        request.getRequestDispatcher("cart/oderDone.jsp").forward(request, response);
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
            default:

                break;
        }
    }

}