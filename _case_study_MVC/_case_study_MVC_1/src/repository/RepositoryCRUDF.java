package repository;

import models.service.ServiceModel;

import java.util.List;

public interface RepositoryCRUDF<E> {
    public List<E> getAll();
    public void insertNew(E e);
    public void update(E e);
    public void removeById(E e);
    public E getById(int id);
    public List<E> searchByName(String subName);

}
