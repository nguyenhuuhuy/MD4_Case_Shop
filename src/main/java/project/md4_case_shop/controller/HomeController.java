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

@WebServlet(value = {"/home"})
public class HomeController extends HttpServlet {
    IProductService productService = new ProductServiceIMPL();
    ICartService cartService = new CartServiceIMPL();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                default:
                    showListProduct(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
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
            default:
                actionSearch(request,response);
                break;
        }
    }

    private void actionSearch(HttpServletRequest request,HttpServletResponse response){
        String search = request.getParameter("search");
        List<Product> productList = productService.findByCategoryAndByName(search.trim());
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("pages/home/home.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> productList = productService.findAll();

        User user = getUserLogin(request);
        if (user!=null){
            List<Cart> cartList = cartService.findCartByUSerId(getUserLogin(request).getId(), CartStatus.NOT_ORDER);

            Cart cart = null;

            if (cartList.size() > 0) {
                cart = cartList.get(0);
            }
            request.setAttribute("cartUser", cart);
        }

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("pages/home/home.jsp").forward(request, response);
    }
    private User getUserLogin(HttpServletRequest request) {
        return (User) request.getSession().getAttribute("userLogin");
    }
}