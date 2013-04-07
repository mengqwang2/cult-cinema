/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mengqwang
 */
public class DBConn {

    public static String driver;
    public static String url;
    public static String user;
    public static String password;
    public static Connection conn;
    public static Statement stmt;
    public ResultSet rs;

    static {
        try {
            driver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
            url = "jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;DatabaseName=aiad017_db";
            user = "aiad017";
            password = "aiad017";
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Successfully Connected");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
            System.err.println("db: " + classnotfoundexception.getMessage());
        } catch (SQLException sqlexception) {
            System.err.println("db.getconn(): " + sqlexception.getMessage());

        }
    }

    public DBConn() {
        this.conn = this.getConn();
    }

    public Connection getConn() {
        return this.conn;
    }

    public void doInsert(String sql) {
        try {
            stmt = conn.createStatement();
            int i = stmt.executeUpdate(sql);
        } catch (SQLException sqlexception) {
            System.err.println("db.executeInset:" + sqlexception.getMessage());
        } finally {
        }
    }

    public void doDelete(String sql) {
        try {
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            int i = stmt.executeUpdate(sql);
        } catch (SQLException sqlexception) {
            System.err.println("db.executeDelete:" + sqlexception.getMessage());
        }
    }

    public void doUpdate(String sql) {
        try {
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            int i = stmt.executeUpdate(sql);
        } catch (SQLException sqlexception) {
            System.err.println("db.executeUpdate:" + sqlexception.getMessage());
        }
    }

    public ResultSet doSelect(String sql) {
        try {
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE, java.sql.ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
            System.out.println("Retrieve results");
        } catch (SQLException sqlexception) {
            System.err.println("db.executeQuery: " + sqlexception.getMessage());
        }
        return rs;
    }

    public void close(ResultSet rs) throws SQLException, Exception {

        if (rs != null) {
            rs.close();
            rs = null;
        }

        if (stmt != null) {
            stmt.close();
            stmt = null;
        }

        if (conn != null) {
            conn.close();
            conn = null;
        }
    }

    public void close() throws SQLException, Exception {
        if (stmt != null) {
            stmt.close();
            stmt = null;
        }

        if (conn != null) {
            conn.close();
            conn = null;
        }
    }
}
