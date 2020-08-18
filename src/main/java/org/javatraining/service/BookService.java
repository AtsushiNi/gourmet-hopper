package org.javatraining.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.BookInfoDAO;
import org.javatraining.entity.Book;

// 書籍情報操作ビジネスロジック
public class BookService {

    private final BookInfoDAO dao = new BookInfoDAO();

    // 書籍情報リストを取得する
    public List<Book> getBooks() throws SQLException, NamingException {
        return dao.findAll();
    }

    // 書籍情報を取得する
    public Book find(int productId) throws SQLException, NamingException {
        return dao.findById(productId);
    }

    // 書籍情報を登録する
    public boolean create(Book book) throws SQLException, NamingException {
        return dao.create(book);
    }

    // 書籍情報を変更する
    public boolean update(Book book) throws SQLException, NamingException {
        return dao.merge(book);
    }

    // 書籍情報を削除する
    public boolean delete(Book book) throws SQLException, NamingException {
        return dao.remove(book);
    }
}