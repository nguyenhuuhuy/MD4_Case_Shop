package project.md4_case_shop.controller;

import project.md4_case_shop.model.Cart;
import project.md4_case_shop.model.CartStatus;
import project.md4_case_shop.model.Product;
import project.md4_case_shop.model.User;
import project.md4_case_shop.service.cart.CartServiceIMPL;
import project.md4_case_shop.service.cart.ICartService;
import project.md4_case_shop.service.product.IProductService;
import project.md4_case_shop.service.product.ProductServiceIMPL;
import project.md4_case_shop.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    private final ICartService cartService = new CartServiceIMPL();
    private final IProductService productService = new ProductServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String checkRoleValidate = UserServiceIMPL.checkCurrenUser(request,response);
            if (checkRoleValidate.equalsIgnoreCase("NONE")){
                return;
            } if (checkRoleValidate.equalsIgnoreCase("user")){
                response.sendRedirect("index.jsp");
                return;
            }
            String action = request.getParameter("action");
            if (action == null) action = "";
            switch (action) {
                case "add":
                    addToCart(request, response);
                    break;
                case "remove":
                    removeFromCart(request, response);
                    break;
                case "order":
                    actionOrder(request, response);
                    break;
                case "manager":
                    formManager(request, response);
                    break;
                case "detail":
                    formDetail(request, response);
                    break;
                case "history":
                    formHistory(request, response);
                    break;
                case "removeUserCart":
                    actionRemoveCart(request, response);
                    break;
                case "cancel":
                    actionCancel(request, response);
                    break;
                default:
                    detailCart(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCancel(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartService.editCartStatus(id, CartStatus.CANCELLED);
        cartService.setChangedTime(id);
        response.sendRedirect("cart?action=manager");
    }

    // xóa cart của user đăng nhập khi đã order
    private void actionRemoveCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartService.deleteById(id);
        response.sendRedirect("cart?action=history");
    }
    // điều hướng tới trang history cầm dữ liệu qua để hiển thị
    private void formHistory(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Cart> orderedCart = cartService.findCartByUSerId(getUserLogin(request).getId(), CartStatus.ORDERED);

        request.setAttribute("orderedCarts", orderedCart);

        List<Cart> confirmedCart = cartService.findCartByUSerId(getUserLogin(request).getId(), CartStatus.DONE);

        request.setAttribute("confirmedCarts", confirmedCart);

        List<Cart> cancelledCart = cartService.findCartByUSerId(getUserLogin(request).getId(), CartStatus.CANCELLED);

        request.setAttribute("cancelledCarts", cancelledCart);


        request.getRequestDispatcher("cart/history.jsp").forward(request, response);
    }

    private void formDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cart cart = (Cart) cartService.findById(id);
        request.setAttribute("cart", cart);
        boolean available = true;

        for (Product product : cart.getProducts()) {
            int stock = productService.findById(product.getId()).getQuantity();
            product.setStock(stock);
            if (stock < product.getQuantity()) {
                available = false;
            }
        }
        request.setAttribute("available", available);
        request.getRequestDispatcher("cart/detail.jsp").forward(request, response);
    }

    private void formManager(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Cart> cartList = cartService.findCartByStatus(CartStatus.ORDERED);
        request.setAttribute("cartList", cartList);
        request.getRequestDispatcher("cart/manager.jsp").forward(request, response);
    }

    private void actionOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        List<Cart> cartList = cartService.findCartByUSerId(getUserLogin(request).getId(), CartStatus.NOT_ORDER);

        if (cartList.size() > 0) {
            if (cartList.get(0).getProducts().size() > 0) {
                cartService.editCartStatus(cartList.get(0).getId(), CartStatus.ORDERED);
                cartService.setCreatedTime(cartList.get(0).getId());
            }
        }

        response.sendRedirect("cart");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("id"));

        Cart cart = cartService.findCartByUSerId(getUserLogin(request).getId(), CartStatus.NOT_ORDER).get(0);

        cartService.removeProductFromCart(cart.getId(), idProduct);

        response.sendRedirect("cart");
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        User userLogin = getUserLogin(request);


        if (userLogin == null) {
            response.sendRedirect("user?action=login");
            return;
        }

        List<Cart> cartList = cartService.findCartByUSerId(userLogin.getId(), CartStatus.NOT_ORDER);

        Cart cart = null;

        if (cartList.size() > 0) {
            cart = cartList.get(0);
        }

        if (cart == null) {
            cart = cartService.save(userLogin.getId());
        }

        int qty = Integer.parseInt(request.getParameter("qty"));
        int idProduct = Integer.parseInt(request.getParameter("id"));

        cartService.addProductToCart(cart.getId(), idProduct, qty);

        response.sendRedirect("home");
    }

    private void detailCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Cart> cartList = cartService.findCartByUSerId(getUserLogin(request).getId(), CartStatus.NOT_ORDER);

        Cart cart = null;

        if (cartList.size() > 0) {
            cart = cartList.get(0);
        }

        request.setAttribute("cart", cart);

        request.getRequestDispatcher("cart/cart.jsp").forward(request, response);
    }

    private User getUserLogin(HttpServletRequest request) {
        return (User) request.getSession().getAttribute("userLogin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String checkRoleValidate = UserServiceIMPL.checkCurrenUser(request,response);
            if (checkRoleValidate.equalsIgnoreCase("NONE")){
                return;
            } if (checkRoleValidate.equalsIgnoreCase("user")){
                response.sendRedirect("index.jsp");
                return;
            }
            String action = request.getParameter("action");
            if (action == null) action = "";
            switch (action) {
                case "detail":
                    actionConfirm(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionConfirm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Cart cart = (Cart) cartService.findById(id);

        for (Product product : cart.getProducts()) {
            int stock = productService.findById(product.getId()).getQuantity();
            if (stock >= product.getQuantity()) {
                product.setQuantity(stock - product.getQuantity());
                productService.save(product);
            }
        }

        cartService.editCartStatus(id, CartStatus.DONE);
        cartService.setChangedTime(id);
        response.sendRedirect("cart?action=manager");
    }

}
