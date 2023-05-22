package project.md4_case_shop.controller;


import project.md4_case_shop.model.*;
import project.md4_case_shop.service.cart.CartServiceIMPL;
import project.md4_case_shop.service.cart.ICartService;
import project.md4_case_shop.service.comment.CommentServiceIMPL;
import project.md4_case_shop.service.comment.ICommentService;
import project.md4_case_shop.service.product.IProductService;
import project.md4_case_shop.service.product.ProductServiceIMPL;


import javax.servlet.RequestDispatcher;
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
    ICommentService commentService = new CommentServiceIMPL();
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
                case "like":
                    try {
                        like(request,response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "detail":
                    detailProduct(request,response);
                    break;
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
            case "comment":
                try {
                    comment(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
//            case "addComment":
//                actionAddComment(request,response);
//                break;
            default:
                actionSearch(request,response);
                break;
        }
    }

    private void comment(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        String commentUser = request.getParameter("comment");
        Comment comment = new Comment(productId,userId,commentUser);
        commentService.save(comment);
        detailProduct(request,response);
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
    private void detailProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        List<Integer> integerList = productService.userLike(id);
        List<Comment> commentList = commentService.commentProduct(id);
        Product product = productService.findById(id);
        User user = getUserLogin(request);
        request.setAttribute("like",integerList.size());
        request.setAttribute("comment",commentList);
        request.setAttribute("userLogin",user);
        request.setAttribute("detail",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/homeDetail.jsp");
        dispatcher.forward(request,response);
    }

    private void like(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = getUserLogin(request);
        int userId = user.getId();
        if (productService.checkLikeUser(id,userId)){
            request.setAttribute("checkLike", "ban da like");
            showListProduct(request,response);
        }else {
            productService.saveLike(id,userId);
           showListProduct(request,response);
        }
    }
}