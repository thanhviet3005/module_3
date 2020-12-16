package customer;

import customer.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerList {
    private static List<Customer> customerList;
        static{
            customerList = new ArrayList<>();
            customerList.add(new Customer("Phuc1",8,"1980","Long An","src/customer/funny_1.jpg"));
            customerList.add(new Customer("Phuc2",9,"1981","Long An","src/customer/funny_1.jpg"));
            customerList.add(new Customer("Phuc3",10,"1982","Long An","src/customer/funny_1.jpg"));
            customerList.add(new Customer("Phuc4",11,"1983","Long An","src/customer/funny_1.jpg"));
        }
        public static List<Customer> getCustomerList(){
            return customerList;
        }

}
