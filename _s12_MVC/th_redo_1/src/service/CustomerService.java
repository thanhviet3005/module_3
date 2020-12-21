package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService {
    private static Map<Integer,Customer> customerList;

    static{
        customerList = new HashMap<>();
        customerList.put(1, new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customerList.put(2, new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customerList.put(3, new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customerList.put(4, new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customerList.put(5, new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customerList.put(6, new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));
    }

    //+__+__+__+__+__+__+__+__+__+__+__+
        // phuong thuc getCustomerList la de hien ra lai dang list, vi hashmap thi thu tu
        // hien ra ko lan nao giong lan nao
    public List<Customer> getCustomerList(){
        return new ArrayList<>(customerList.values());
    }

        // phuong thuc saveCustomer la de luu lai thong tin da chinh sua cho de
    public void saveCustomer(Customer customer){
        customerList.put(customer.getId(), customer);
    }

        // phuong thuc deleteCustomer  la de xoa luon theo id
    public void deleteCustomer(int id){
        customerList.remove(id);
    }

        // phuong thuc findById la de dung cho viec edit/update thong tin khach hang
    public Customer findById(int id){
        return customerList.get(id);
    }


    //+__+__+__+__+__+__+__+__+__+__+__+__
}
