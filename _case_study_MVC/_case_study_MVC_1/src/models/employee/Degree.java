package models.employee;

public class Degree {
    private int id;
    private String degreeName;

    public Degree() {
    }

    public Degree(int id, String degreeName) {
        this.id = id;
        this.degreeName = degreeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDegreeName() {
        return degreeName;
    }

    public void setDegreeName(String degreeName) {
        this.degreeName = degreeName;
    }
}
