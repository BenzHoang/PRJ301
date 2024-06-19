package Dao;

import Model.Mobile;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MobileDAO {
    
    public Connection getConnection() throws Exception {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionString = "jdbc:sqlserver://localhost:1433;database=MyShop";
            Connection cnn = DriverManager.getConnection(connectionString, "sa", "12345");
            return cnn;
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        }
    }
    
    public boolean addMobile(Mobile mobile) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = null;
        try {
            cnn = getConnection();
            String sql = "Insert Mobiles values(?,?,?,?,?,?,?,?)";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobile.getMobileID());
            preStm.setString(2, mobile.getDescription());
            preStm.setFloat(3, mobile.getPrice());
            preStm.setString(4, mobile.getMobileName());
            preStm.setString(5, mobile.getProducerName());
            preStm.setInt(6, mobile.getYearOfProduction());
            preStm.setInt(7, mobile.getQuantity());
            preStm.setBoolean(8, mobile.isNotSale());
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            
            if (preStm != null) {
                preStm.close();
            }
        }
    }
    
    public boolean updateMobile(Mobile mobile) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = null;
        try {
            cnn = getConnection();
            String sql = "Update Mobiles set [description] = ?, price = ?, mobileName = ?, producerName = ?, yearOfProduction = ?, quantity = ?, notSale = ? where mobileID = ?";
            preStm = cnn.prepareStatement(sql);
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobile.getDescription());
            preStm.setFloat(2, mobile.getPrice());
            preStm.setString(3, mobile.getMobileName());
            preStm.setString(4, mobile.getProducerName());
            preStm.setInt(5, mobile.getYearOfProduction());
            preStm.setInt(6, mobile.getQuantity());
            preStm.setBoolean(7, mobile.isNotSale());
            preStm.setString(8, mobile.getMobileID());
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            
            if (preStm != null) {
                preStm.close();
            }
        }
    }
    
    public boolean deleteMobile(String mobileID) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = null;
        try {
            cnn = getConnection();
            String sql = "Delete from Mobiles where mobileID = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobileID);
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            
            if (preStm != null) {
                preStm.close();
            }
        }
    }
    
    public Mobile getMobileByID(String mobileID) throws Exception {
        Mobile mobile = null;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        String description, mobileName, producerName;
        int yearOfProduction, quantity;
        boolean notSale;
        float price;
        try {
            cnn = getConnection();
            String sql = "Select [description], price, mobileName, producerName, yearOfProduction, quantity, notSale from Mobiles where mobileID = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobileID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                description = rs.getString(1);
                price = rs.getFloat(2);
                mobileName = rs.getString(3);
                producerName = rs.getString(4);
                yearOfProduction = rs.getInt(5);
                quantity = rs.getInt(6);
                notSale = rs.getBoolean(7);
                mobile = new Mobile(mobileID, description, price, mobileName, producerName, yearOfProduction, quantity, notSale);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            
            if (rs != null) {
                rs.close();
            }
            
            if (preStm != null) {
                preStm.close();
            }
        }
        return mobile;
    }
    
    public List<Mobile> getAllMobile() throws Exception {
        String mobileID, description, mobileName, producerName;
        int yearOfProduction, quantity;
        boolean notSale;
        float price;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<Mobile> mobileList = new ArrayList<>();
        try {
            cnn = getConnection();
            String sql = "Select * from Mobiles";
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                mobileID = rs.getString(1);
                description = rs.getString(2);
                price = rs.getFloat(3);
                mobileName = rs.getString(4);
                producerName = rs.getString(5);
                yearOfProduction = rs.getInt(6);
                quantity = rs.getInt(7);
                notSale = rs.getBoolean(8);
                Mobile mobile = new Mobile(mobileID, description, price, mobileName, producerName, yearOfProduction, quantity, notSale);
                mobileList.add(mobile);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            
            if (rs != null) {
                rs.close();
            }
            
            if (preStm != null) {
                preStm.close();
            }
        }
        return mobileList;
    }
    
    public List<Mobile> searchByIDorName(String searchValue) throws Exception {
        String mobileID, description, mobileName , producerName;
        int yearOfProduction, quantity;
        boolean notSale;
        float price;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<Mobile> mobileList = new ArrayList<>();
        try {
            cnn = getConnection();
            String sql = "Select mobileID, [description], price, mobileName, producerName, yearOfProduction, quantity, notSale from Mobiles where mobileID like ? or mobileName like ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, "%" + searchValue + "%");
            preStm.setString(2, "%" + searchValue + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                mobileID = rs.getString(1);
                description = rs.getString(2);
                price = rs.getFloat(3);
                mobileName = rs.getString(4);
                producerName = rs.getString(5);
                yearOfProduction = rs.getInt(6);
                quantity = rs.getInt(7);
                notSale = rs.getBoolean(8);
                Mobile mobile = new Mobile(mobileID, description, price, mobileName, producerName, yearOfProduction, quantity, notSale);
                mobileList.add(mobile);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            
            if (rs != null) {
                rs.close();
            }
            
            if (preStm != null) {
                preStm.close();
            }
        }
        return mobileList;
    }
    
    public List<Mobile> searchByPrice(String minPrice, String maxPrice) throws Exception {
        String mobileID, description, mobileName, producerName;
        int yearOfProduction, quantity;
        boolean notSale;
        float price;
        float Min = Float.parseFloat(minPrice);
        float Max = Float.parseFloat(maxPrice);
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<Mobile> mobileList = new ArrayList<>();
        try {
            cnn = getConnection();
            String sql = "Select mobileID,[description], price, mobileName, producerName, yearOfProduction, quantity, notSale from Mobiles where price > ? and price <= ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setFloat(1, Min);
            preStm.setFloat(2, Max);
            rs = preStm.executeQuery();
            while (rs.next()) {
                mobileID = rs.getString(1);
                description = rs.getString(2);
                price = rs.getFloat(3);
                mobileName = rs.getString(4);
                producerName = rs.getString(5);
                yearOfProduction = rs.getInt(6);
                quantity = rs.getInt(7);
                notSale = rs.getBoolean(8);
                Mobile mobile = new Mobile(mobileID, description, price, mobileName, producerName, yearOfProduction, quantity, notSale);
                mobileList.add(mobile);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            
            if (rs != null) {
                rs.close();
            }
            
            if (preStm != null) {
                preStm.close();
            }
        }
        return mobileList;
    }
}
