package com.my.jdbc;

import lombok.extern.log4j.Log4j;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

@Log4j
public class JDBCTests {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void TestConnection() {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie",
                "root", "mariadb")) {
            log.info(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
