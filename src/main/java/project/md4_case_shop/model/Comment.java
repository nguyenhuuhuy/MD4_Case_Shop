package project.md4_case_shop.model;

public class Comment {
    private int id;
    private int productId;
    private int userId;
    private String username;
    private String avatar;
    String comment;
    boolean status = false;

    public Comment(int productId, int userId, String comment) {
        this.productId = productId;
        this.userId = userId;
        this.comment = comment;
    }

    public Comment(String name, String avatar, int id, int userId, int idProduct, String comment, boolean status) {
        this.username = name;
        this.avatar = avatar;
        this.id = id;
        this.userId = userId;
        this.productId = idProduct;
        this.comment = comment;
        this.status = status;
    }

    public Comment(int productId, int userId, String comment, boolean status) {
        this.productId = productId;
        this.userId = userId;
        this.comment = comment;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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
