package Utility;  
  
import java.io.*;     
import java.sql.*;     
  
public class DBConn {     
        public static String driver;//定义驱动     
        public static String url;//定义URL     
        public static String user;//定义用户名     
        public static String password;//定义密码     
        public static Connection conn;//定义连接     
        public static Statement stmt;//定义STMT     
        public ResultSet rs;//定义结果集     
        //设置CONN     
        static{     
            try {   
                driver="com.microsoft.jdbc.sqlserver.SQLServerDriver";  
                url="jdbc:microsoft:sqlserver://w2ksa.cs.cityu.edu.hk:1433;DatabaseName=aiad017_db";  
                user="aiad017";  
                password="aiad017";  
                Class.forName(driver);     
                conn = DriverManager.getConnection(url,user,password);  
                System.out.println("-------连接成功------");  
            } catch(ClassNotFoundException classnotfoundexception) {     
                  classnotfoundexception.printStackTrace();     
                System.err.println("db: " + classnotfoundexception.getMessage());     
            } catch(SQLException sqlexception) {     
                System.err.println("db.getconn(): " + sqlexception.getMessage());     
            }     
        }     
        //构造函数，默认加裁配置文件为jdbc.driver     
        public DBConn(){     
            this.conn=this.getConn();  
        }     
        //返回Conn     
        public Connection getConn(){     
            return this.conn;     
        }     
        //执行插入     
           public void doInsert(String sql) {     
            try {    
                conn=DriverManager.getConnection(url,user,password); 
                stmt = conn.createStatement();     
                int i = stmt.executeUpdate(sql);     
            } catch(SQLException sqlexception) {     
                System.err.println("db.executeInset:" + sqlexception.getMessage());     
            }finally{     
                     
            }     
        }     
        //执行删除     
        public void doDelete(String sql) {     
            try {   
                conn=DriverManager.getConnection(url,user,password); 
                stmt = conn.createStatement();     
                int i = stmt.executeUpdate(sql);     
            } catch(SQLException sqlexception) {     
                System.err.println("db.executeDelete:" + sqlexception.getMessage());     
            }     
        }     
        //执行更新     
        public void doUpdate(String sql) {     
            try {     
                conn=DriverManager.getConnection(url,user,password); 
                stmt = conn.createStatement();     
                int i = stmt.executeUpdate(sql);     
            } catch(SQLException sqlexception) {     
                System.err.println("db.executeUpdate:" + sqlexception.getMessage());     
            }     
        }     
        //查询结果集     
        public ResultSet doSelect(String sql) {     
            try {  
                conn=DriverManager.getConnection(url,user,password);  
                stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);       
                rs = stmt.executeQuery(sql);   
                System.out.println("取得结果集");  
            } catch(SQLException sqlexception) {     
                System.err.println("db.executeQuery: " + sqlexception.getMessage());     
            }     
            return rs;     
        }     
        /**   
         *关闭数据库结果集，数据库操作对象，数据库链接   
           @Function: Close all the statement and conn int this instance and close the parameter ResultSet   
           @Param: ResultSet   
           @Exception: SQLException,Exception   
          **/    
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