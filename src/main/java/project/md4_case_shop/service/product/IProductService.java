package project.md4_case_shop.service.product;

import project.md4_case_shop.model.Product;
import project.md4_case_shop.service.IGenericService;

import java.util.List;

public interface IProductService extends IGenericService<Product> {
    List<Product> findByCategoryAndByName(String categorySearch);

    void saveLike(int productId, int userId);

    boolean checkLikeUser(int productId, int userId);

    List<Integer> userLike(int productId);
}
