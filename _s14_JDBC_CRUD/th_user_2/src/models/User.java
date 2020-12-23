package models;

public class User {
    private int id;
    private String name;

    private int age;

    private String gender;
    private String email;
    private String country;

    public User() {
    }

    public User(String name, int age, String gender, String email, String country) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.email = email;
        this.country = country;
    }

    public User(int id, String name, int age, String gender, String email, String country) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.email = email;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
