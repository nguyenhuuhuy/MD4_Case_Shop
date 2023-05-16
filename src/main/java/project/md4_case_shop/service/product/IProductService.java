package project.md4_case_shop.service.product;

import project.md4_case_shop.model.Product;
import project.md4_case_shop.service.IGenericService;

import java.util.List;

public interface IProductService extends IGenericService<Product> {
    List<Product> findByCategoryAndByName(String categorySearch);
}
