package models.employee;

public class Employee {
    private int id;
    private String name;
    private String birthday;
    private String idCard;
    private double salary;
    private String phone;
    private String email;
    private String address;
    private String posName;
    private String degName;
    private String divName;
    private int positionId;
    private int degreeId;
    private int divisionId;
    private String userName;


    public Employee() {
    }
    // constructor dung positionId, degreeId... la dung cho nhan du lieu tu database ve tu
    // bang result set de hien len trang web
    public Employee(int id, String name, String birthday, String idCard, double salary,
                    String phone, String email, String address, String posName, String degName,
                    String divName, String userName) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.posName = posName;
        this.degName = degName;
        this.divName = divName;
        this.userName = userName;
    }
// constructor dung positionId, degreeId... la dung cho post len database
    public Employee(int id, String name, String birthday, String idCard, double salary,
                    String phone, String email, String address, int positionId, int degreeId,
                    int divisionId, String userName) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionId = positionId;
        this.degreeId = degreeId;
        this.divisionId = divisionId;
        this.userName = userName;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getIdCard() {
        return idCard;
    }

    public double getSalary() {
        return salary;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getPosName() {
        return posName;
    }

    public String getDegName() {
        return degName;
    }

    public String getDivName() {
        return divName;
    }

    public int getPositionId() {
        return positionId;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public String getUserName() {
        return userName;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPosName(String posName) {
        this.posName = posName;
    }

    public void setDegName(String degName) {
        this.degName = degName;
    }

    public void setDivName(String divName) {
        this.divName = divName;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    //__+__+__+__+__+__+__+__+__+__+__+__+__
}
