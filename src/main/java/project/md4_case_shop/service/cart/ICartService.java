package project.md4_case_shop.service.cart;

import project.md4_case_shop.model.Cart;
import project.md4_case_shop.model.CartStatus;
import project.md4_case_shop.model.Product;
import project.md4_case_shop.service.IGenericService;

import java.sql.SQLException;
import java.util.List;

public interface ICartService extends IGenericService {
    List<Cart> findCartByUSerId(int idUser, CartStatus status) throws SQLException;

    List<Product> findProductsByCartId(int idCart) throws SQLException;

    Cart save(int idUser) throws SQLException;

    void addProductToCart(int idCart, int idProduct, int quantity) throws SQLException;

    void removeProductFromCart(int idCart, int idProduct) throws SQLException;

    void editCartStatus(int idCart, CartStatus status) throws SQLException;

    List<Cart> findCartByStatus(CartStatus status) throws SQLException;
    void setCreatedTime(int id) throws SQLException;
    void setChangedTime(int id) throws SQLException;
    float totalCart(List<Cart> cartList);
}
