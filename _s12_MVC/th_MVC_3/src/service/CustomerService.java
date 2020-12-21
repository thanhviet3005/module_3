package service;

import models.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService {
    private static Map<Integer, Customer> customerMap;
    static {
        customerMap = new HashMap<>();
        customerMap.put(1, new Customer(1, "Rose", "rose@codegym.vn", "Newyork"));
        customerMap.put(2, new Customer(2, "Sophia", "sophia@codegym.vn", "Miami"));
        customerMap.put(3, new Customer(3, "Adam", "adam@codegym.vn", "Beijin"));
        customerMap.put(4, new Customer(4, "Alex", "alex@codegym.vn", "Saigon"));
        customerMap.put(5, new Customer(5, "Bill", "bill@codegym.vn", "Danang"));
        customerMap.put(6, new Customer(6, "John", "john@codegym.vn", "Hanoi"));
    }

    public List<Customer> getPageArrList(){
        return new ArrayList<>(customerMap.values());
    }

    public void saveCustomer(Customer customer){
        customerMap.put(customer.getId(), customer);
    }

    public Customer findById(int id){
        return customerMap.get(id);
    }

    public void removeById(int id){
        customerMap.remove(id);
    }




}
