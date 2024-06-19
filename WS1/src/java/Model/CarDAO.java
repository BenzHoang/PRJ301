package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {

    public static Connection getConnection() throws Exception {
        Connection cnn;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionString = "jdbc:sqlserver://localhost:1433;database=MyStock";
            cnn = DriverManager.getConnection(connectionString, "sa", "12345");
            return cnn;
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        }
    }

    public List<Car> getAllCar() throws Exception {
        int carID, releasedYear;
        String carName, manufacturer;
        double price;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<Car> carList = new ArrayList<>();
        try {
            cnn = getConnection();
            String sql = "select CarID, CarName, Manufacturer, Price, ReleasedYear from Cars";
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                carID = rs.getInt(1);
                carName = rs.getString(2);
                manufacturer = rs.getString(3);
                price = rs.getDouble(4);
                releasedYear = rs.getInt(5);
                Car car = new Car(carID, carName, manufacturer, price, releasedYear);
                carList.add(car);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
        return carList;
    }

    public Car getCarById(int carID) throws Exception {
        Car car = null;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        String carName, manufacturer;
        double price;
        int releasedYear;
        try {
            cnn = getConnection();
            String sql = "Select CarName, Manufacturer, Price, ReleasedYear from Cars where CarID=?";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, carID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                carName = rs.getString(1);
                manufacturer = rs.getString(2);
                price = rs.getDouble(3);
                releasedYear = rs.getInt(4);
                car = new Car(carID, carName, manufacturer, price, releasedYear);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return car;
    }

    public boolean addACar(Car car) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = null;
        try {
            cnn = getConnection();
            String sql = "Insert Cars values(?,?,?,?,?)";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, car.getCarID());
            preStm.setString(2, car.getCarName());
            preStm.setString(3, car.getManufacturer());
            preStm.setDouble(4, car.getPrice());
            preStm.setInt(5, car.getReleasedYear());
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }

    public boolean updateACar(Car car) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = null;
        try {
            cnn = getConnection();
            String sql = "Update Cars set CarName=?, Manufacturer=?, Price=?, ReleasedYear=? where CarID = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, car.getCarName());
            preStm.setString(2, car.getManufacturer());
            preStm.setDouble(3, car.getPrice());
            preStm.setInt(4, car.getReleasedYear());
            preStm.setInt(5, car.getCarID());
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }

    public boolean deleteACar(int carID) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = null;
        try {
            cnn = getConnection();
            String sql = "Delete from Cars where CarID = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, carID);
             return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }
}
