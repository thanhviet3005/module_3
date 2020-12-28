package models.customer;

public class CustomerType {
    private int id;
    private String cusTypeName;

    public CustomerType() {
    }

    public CustomerType(int id, String cusTypeName) {
        this.id = id;
        this.cusTypeName = cusTypeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCusTypeName() {
        return cusTypeName;
    }

    public void setCusTypeName(String cusTypeName) {
        this.cusTypeName = cusTypeName;
    }
}
