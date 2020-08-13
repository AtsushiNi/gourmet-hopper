package org.javatraining.dao;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// DataSource提供クラス 
public class DataSourceSupplier {
    private static DataSource ds = null;

    public static DataSource getDataSource() throws NamingException {

        // 初回の呼び出し時のみ、データソースをインスタンス化
        if (ds == null) {
            ds = (DataSource) new InitialContext().lookup("jdbc/tx");
        }
        return ds;
    }
}
