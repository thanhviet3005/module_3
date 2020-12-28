package models.contract;

public class Contract {
    private int contract_id;
    private String contract_start_date;
    private String contract_end_date;
    private double contract_deposition;
    private double contract_total_money;
    private int employee_id;
    private int customer_id;
    private int service_id;
    private String employee_name;
    private String customer_name;
    private String service_name;

    public Contract() {
    }

    public Contract(int contract_id, String contract_start_date, String contract_end_date
            , double contract_deposition, double contract_total_money, String employee_name
            , String customer_name, String service_name) {
        this.contract_id = contract_id;
        this.contract_start_date = contract_start_date;
        this.contract_end_date = contract_end_date;
        this.contract_deposition = contract_deposition;
        this.contract_total_money = contract_total_money;
        this.employee_name = employee_name;
        this.customer_name = customer_name;
        this.service_name = service_name;
    }

    public Contract(int contract_id, String contract_start_date, String contract_end_date
            , double contract_deposition, double contract_total_money, int employee_id
            , int customer_id, int service_id) {
        this.contract_id = contract_id;
        this.contract_start_date = contract_start_date;
        this.contract_end_date = contract_end_date;
        this.contract_deposition = contract_deposition;
        this.contract_total_money = contract_total_money;
        this.employee_id = employee_id;
        this.customer_id = customer_id;
        this.service_id = service_id;
    }

    public int getContract_id() {
        return contract_id;
    }

    public String getContract_start_date() {
        return contract_start_date;
    }

    public String getContract_end_date() {
        return contract_end_date;
    }

    public double getContract_deposition() {
        return contract_deposition;
    }

    public double getContract_total_money() {
        return contract_total_money;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public int getService_id() {
        return service_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public String getService_name() {
        return service_name;
    }

    public void setContract_id(int contract_id) {
        this.contract_id = contract_id;
    }

    public void setContract_start_date(String contract_start_date) {
        this.contract_start_date = contract_start_date;
    }

    public void setContract_end_date(String contract_end_date) {
        this.contract_end_date = contract_end_date;
    }

    public void setContract_deposition(double contract_deposition) {
        this.contract_deposition = contract_deposition;
    }

    public void setContract_total_money(double contract_total_money) {
        this.contract_total_money = contract_total_money;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }
}
