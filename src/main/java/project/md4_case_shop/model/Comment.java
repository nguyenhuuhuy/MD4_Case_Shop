package project.md4_case_shop.model;

public class Comment {
    private int id;
    private int productId;
    private int userId;
    String comment;
    boolean status = false;

    public Comment() {
    }

    public Comment(int id, int productId, int userId, String comment, boolean status) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.comment = comment;
        this.status = status;
    }

    public Comment(int productId, int userId, String comment) {
        this.productId = productId;
        this.userId = userId;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
