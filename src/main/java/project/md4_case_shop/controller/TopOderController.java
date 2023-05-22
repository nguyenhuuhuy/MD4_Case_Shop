package project.md4_case_shop.controller;

import project.md4_case_shop.model.Product;
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

@WebServlet(value = "/topOder")
public class TopOderController extends HttpServlet {
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
            default:
               topOder(request,response);
        }
    }
    private void topOder(HttpServletRequest request,HttpServletResponse response){
        List<Product> productList = productService.topShopping();
        request.setAttribute("list",productList);
        try {
            request.getRequestDispatcher("pages/admin/adminManage.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
