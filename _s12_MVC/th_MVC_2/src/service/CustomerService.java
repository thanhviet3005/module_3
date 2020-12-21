package service;

import models.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService {
    private static Map<Integer, Customer> customerList;
    static {
        customerList = new HashMap<>();
        customerList.put(1, new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customerList.put(2, new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customerList.put(3, new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customerList.put(4, new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customerList.put(5, new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customerList.put(6, new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));
    }

    public List<Customer> getArrListCustomer(){
        return new ArrayList<>(customerList.values());
    }

    public void saveCustomer(Customer customer){
        customerList.put(customer.getId(), customer);
    }

    public Customer findById(int id){
        return customerList.get(id);
    }

    public void removeById(int id){
        customerList.remove(id);
    }

}
