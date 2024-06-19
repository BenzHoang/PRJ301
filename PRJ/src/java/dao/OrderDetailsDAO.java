/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDetails;
import dto.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Admins
 */
public class OrderDetailsDAO {

    productDAO proDAO = new productDAO();

    public static void main(String[] args) {
        OrderDetailsDAO dao = new OrderDetailsDAO();
        System.out.println(dao.updateOrderDetail(3, 1, 4));
    }

    public ArrayList<OrderDetails> getDetailsByOrderID(int OrderID) {
        ArrayList<OrderDetails> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [OrderID]\n"
                        + "      ,[ProductID]\n"
                        + "      ,[UnitPrice]\n"
                        + "      ,[Quantity]\n"
                        + "  FROM [project_prj].[dbo].[Order_Details] where OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                //lay emai,password cua input params gan vao 2 cho ?
                pst.setInt(1, OrderID);
                //run cau sql
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int OrderId = table.getInt("OrderID");
                        double UnitPrice = table.getFloat("UnitPrice");
                        int Quantity = table.getInt("Quantity");
                        OrderDetails detail = new OrderDetails(OrderId, proDAO.getProduct(table.getInt("ProductID")), UnitPrice, Quantity);
                        list.add(detail);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public int deleteDetailByProductIdOrderID(int orderID, int productId) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "delete from Order_Details where OrderID = ? and ProductID = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, orderID);
                st.setInt(2, productId);
                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public int updateOrderDetail(int orderID, int productID, int quantity) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Order_Details]\n"
                        + "   SET [Quantity] = ? \n"
                        + " WHERE OrderID = ? and  ProductID = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, quantity);
                st.setInt(2, orderID);
                st.setInt(3, productID);
                result = st.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
