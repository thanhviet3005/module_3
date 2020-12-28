package models.employee;

public class Division {
    private int id;
    private String divisionName;

    public Division() {
    }

    public Division(int id, String divName) {
        this.id = id;
        this.divisionName = divName;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }
}
