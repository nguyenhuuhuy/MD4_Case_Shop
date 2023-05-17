package project.md4_case_shop.controller;

import project.md4_case_shop.model.Product;
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

@WebServlet(value = {"/product"})
public class ProductController extends HttpServlet {
    IProductService productService = new ProductServiceIMPL();

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
                case "create":
                    showFormCreate(request, response);
                    break;
                case "edit":
                    showFormEdit(request, response);
                    break;
                case "delete":
                    showFormDelete(request, response);
                    break;
                case "detail":
                    showFormDetail(request, response);
                    break;
                default:
                    showListProduct(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/detail.jsp");
        dispatcher.forward(request, response);

    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/delete.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "create":
                    actionFormCreate(request, response);
                    break;
                case "edit":
                    actionEdit(request, response);
                    break;
                case "delete":
                    actionDelete(request, response);
                    break;
                default:
                    actionSearchProduct(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionSearchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search");
        List<Product> productListSearch = productService.findByCategoryAndByName(name);
        request.setAttribute("productList", productListSearch);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }


    private void actionDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteById(id);
        request.setAttribute("message", "DELETE PRODUCT SUCCESS !!!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/delete.jsp");
        dispatcher.forward(request, response);
    }

    private void actionEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        String name = request.getParameter("name");
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        float price = Float.parseFloat(request.getParameter("price"));
        String image = request.getParameter("image");
        int qty = Integer.parseInt(request.getParameter("qty"));
        product.setName(name);
        product.setIdCategory(idCategory);
        product.setPrice(price);
        product.setImage(image);
        product.setQuantity(qty);
        productService.save(product);
        request.setAttribute("message", "EDIT PRODUCT SUCCESS !!!");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void actionFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        float price = Float.parseFloat(request.getParameter("price"));
        String image = request.getParameter("image");
        int qty = Integer.parseInt(request.getParameter("qty"));
        Product product = new Product(name, idCategory, price, image, qty);
        productService.save(product);

        request.setAttribute("message", "CREATED PRODUCT SUCCESS !!!");

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }
}