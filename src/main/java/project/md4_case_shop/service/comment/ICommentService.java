package project.md4_case_shop.service.comment;

import project.md4_case_shop.model.Comment;
import project.md4_case_shop.model.User;
import project.md4_case_shop.service.IGenericService;

import java.util.List;

public interface ICommentService extends IGenericService<Comment> {
List<Comment> commentProduct(int productId);

}
