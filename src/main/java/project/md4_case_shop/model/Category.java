package project.md4_case_shop.model;

public class Category {
    private int cId;
    private String cName;

    public Category() {
    }

    public Category(String name) {
        this.cName=name;
    }

    public Category(int cId, String cName) {
        this.cId = cId;
        this.cName = cName;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    @Override
    public String toString() {
        return "Category{ " +
                "cId=" + cId +
                "- cName='" + cName + '\'' +
                " }";
    }
}
