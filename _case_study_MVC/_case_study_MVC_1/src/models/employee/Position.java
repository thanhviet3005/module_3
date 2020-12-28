package models.employee;

public class Position {
    private int id;
    private String positionName;

    public Position() {
    }

    public Position(int id, String posName) {
        this.id = id;
        this.positionName = posName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
