package org.javatraining.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.BookDAO;
import org.javatraining.entity.Book;

// 書籍情報操作ビジネスロジック
public class BookService {

    private final BookDAO dao = new BookDAO();

    // 書籍情報リストを取得する
    public List<Book> getBooks() throws SQLException, NamingException {
        System.out.println("[BookService.java]:getBooks Start");
        return dao.findAll();
    }

    // 書籍情報を取得する
    public Book find(int productId) throws SQLException, NamingException {
        System.out.println("[BookService.java]:find Start");
        return dao.findById(productId);
    }

    // 書籍情報を登録する
    public boolean create(Book book) throws SQLException, NamingException {
        System.out.println("[BookService.java]:create Start");
    	return dao.create(book);
    }

    // 書籍情報を変更する
    public boolean update(Book book) throws SQLException, NamingException {
        System.out.println("[BookService.java]:update Start");
    	return dao.merge(book);
    }

    // 書籍情報を削除する
    public boolean delete(Book book) throws SQLException, NamingException {
        System.out.println("[BookService.java]:delete Start");
        return dao.remove(book);
    }
}