package project.md4_case_shop.service;

import java.sql.SQLException;
import java.util.List;

public interface IGenericService<T> {
    List<T> findAll() throws SQLException;
    void save (T t) throws SQLException;
    T findById(int id) throws SQLException;
    void deleteById(int id) throws SQLException;
}
