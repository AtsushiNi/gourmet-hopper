package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.javatraining.entity.Book;

// 書籍情報テーブルへのアクセスを行うクラス
public class BookInfoDAO {
    // 書籍情報テーブルを全件検索する
    public List<Book> findAll() throws SQLException, NamingException {

        // book INFO テーブルを全件検索する SQL文
        String sql = "SELECT PROD_ID,BOOK_NAME,AUTHOR,AMOUNT,LOCATION,DESCRIPTION FROM BOOK_INFO";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            // 書籍情報オブジェクトの List を生成
            List<Book> books = new ArrayList<>();
            // 検索結果をループして書籍情報オブジェクトの List に格納
            while (rs.next()) {
                // 書籍情報オブジェクトを生成
                Book book = createBook(rs);
                // 書籍情報オブジェクトの List に格納
                books.add(book);
            }
            // 書籍情報オブジェクトの List を返す
            return books;
        }
    }

    // 書籍情報テーブルを主キー検索する
    public Book findById(int productId) throws SQLException, NamingException {

        // BOOK_INFO テーブルを商品 ID の条件で検索する SQL 文
        String sql = "SELECT PROD_ID,BOOK_NAME,AUTHOR, AMOUNT,LOCATION,DESCRIPTION FROM BOOK_INFO WHERE PROD_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                // 検索結果が存在しない場合、NULL を返す
                if (!rs.next()) {
                    return null;
                }
                // 書籍情報オブジェクトを生成
                Book book = createBook(rs);

                // 書籍情報を返す
                return book;
            }
        }
    }

    // 書籍情報テーブルに書籍情報を新規登録する
    public boolean create(Book book) throws SQLException, NamingException {

        // INSERT INFO テーブルにデータを追加する SQL文
        String sql = "INSERT INTO BOOK_INFO (BOOK_NAME,AUTHOR,AMOUNT,LOCATION,DESCRIPTION ) VALUES (?, ?, ?, ?, ?)";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setInt(3, book.getAmount());
            ps.setString(4, book.getLocation());
            if ("".equals(book.getDescription().trim())) {
                ps.setNull(5, java.sql.Types.VARCHAR);
            } else {
                ps.setString(5, book.getDescription().trim());
            }

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean insResult = affectedRows == 1;

            // 実行結果を返す
            return insResult;
        }
    }

    // 書籍情報テーブルに書籍情報を更新する
    public boolean merge(Book book) throws SQLException, NamingException {

        // INSERT INFO テーブルのデータを更新する SQL文
        String sql = "UPDATE BOOK_INFO SET BOOK_NAME = ? ,AUTHOR = ? , AMOUNT = ?, LOCATION = ? , DESCRIPTION = ?  WHERE PROD_ID = ? ";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){
            // プレース・ホルダに値を設定
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setInt(3, book.getAmount());
            ps.setString(4, book.getLocation());
            if ("".equals(book.getDescription().trim())) {
                ps.setNull(5, java.sql.Types.VARCHAR);
            } else {
                ps.setString(5, book.getDescription().trim());
            }
            ps.setInt(6, book.getProductId());

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean updResult = affectedRows == 1;

            // 実行結果を返す
            return updResult;
        }
    }

    // 書籍情報テーブルから書籍情報を削除する
    public boolean remove(Book book) throws SQLException, NamingException {
        // BOOK INFO テーブルからデータを削除する SQL 文
        String sql = "DELETE FROM BOOK_INFO WHERE PROD_ID = ?";
        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){
            // プレース・ホルダに値を設定
            ps.setInt(1, book.getProductId());
            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean delResult = affectedRows == 1;
            // 実行結果を返す
            return delResult;
        }
    }

    // ResultSetから書籍情報オブジェクトを生成する
    private Book createBook(ResultSet rs) throws SQLException {
        Book book = new Book();

        book.setProductId(rs.getInt("PROD_ID"));
        book.setBookName(rs.getString("BOOK_NAME"));
        book.setAuthor(rs.getString("AUTHOR"));
        book.setAmount(rs.getInt("AMOUNT"));
        book.setLocation(rs.getString("LOCATION"));
        if (rs.getString("DESCRIPTION") == null) {
            book.setDescription("");
        } else {
            book.setDescription(rs.getString("DESCRIPTION"));
        }

        return book;
    }
}