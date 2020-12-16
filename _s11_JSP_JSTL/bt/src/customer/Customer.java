package customer;

public class Customer {
    private String name;
    private Integer age;
    private String birthDate;
    private String address;
    private String avatar;

    public Customer() {
    }

    public Customer(String name, Integer age, String birthDate, String address, String avatar) {
        this.name = name;
        this.age = age;
        this.birthDate = birthDate;
        this.address = address;
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
