/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Orders;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import mylib.DBUtils;

/**
 *
 * @author Admins
 */
public class OrdersDAO {

    productDAO PDAO = new productDAO();
    SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");

    public ArrayList<Orders> listOrders() {
        ArrayList<Orders> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [OrderID]\n"
                        + "      ,[CustomerID]\n"
                        + "      ,[OrderDate]\n"
                        + "      ,[RequiredDate]\n"
                        + "      ,[ShippedDate]\n"
                        + "      ,[TotalProducts]\n"
                        + "      ,[ShipAddress]\n"
                        + "      ,[Status]\n"
                        + "  FROM [dbo].[Orders]";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int OrderID = table.getInt("OrderID");
                        int CustomerID = table.getInt("CustomerID");
                        String OrderDate = sm.format(table.getDate("OrderDate"));
                        String RequiredDate = sm.format(table.getDate("RequiredDate"));
                        String ShippedDate = sm.format(table.getDate("ShippedDate"));
                        int totalProducts = table.getInt("TotalProducts");
                        String ShipAddress = table.getString("ShipAddress");
                        int status = table.getInt("Status");
                        Orders acc = new Orders(OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate, totalProducts, ShipAddress, status);
                        list.add(acc);
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

    public float getAllTotalByOrderId(int orderID) {
        float result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [OrderDetailID]\n"
                        + "      ,[OrderID]\n"
                        + "      ,[ProductID]\n"
                        + "      ,[UnitPrice]\n"
                        + "      ,[Quantity]\n"
                        + "  FROM [project_prj].[dbo].[Order_Details]\n"
                        + "  where [OrderID] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                //lay emai,password cua input params gan vao 2 cho ?
                pst.setInt(1, orderID);
                //run cau sql
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        result += Float.parseFloat(table.getString("UnitPrice"));
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

        return result;
    }

    public static void main(String[] args) {
        OrdersDAO dao = new OrdersDAO();
        System.out.println(dao.listOrdersByDateStartedDateEnd("2024-03-10", "2024-03-13"));
    }

    public int insertOrder(Orders newOrder, HashMap<Integer, Integer> giohang) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                cn.setAutoCommit(false);
                //insert order
                String sql = "INSERT INTO [dbo].[Orders]\n"
                        + "           ([CustomerID]\n"
                        + "           ,[OrderDate]\n"
                        + "           ,[RequiredDate]\n"
                        + "           ,[ShippedDate]\n"
                        + "           ,[TotalProducts]\n"
                        + "           ,[ShipAddress]\n "
                        + "                     ,[Status])"
                        + "     VALUES \n"
                        + "           (?,?,?,?,?,?,1)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, newOrder.getCustomerID());
                pst.setDate(2, new Date(System.currentTimeMillis()));
                pst.setString(3, newOrder.getRequiredDate());
                pst.setString(4, newOrder.getShippedDate());
                pst.setInt(5, newOrder.getTotalProducts());
                pst.setString(6, newOrder.getShipAddress());
                result = pst.executeUpdate();
                if (result > 0) {
                    //lay orderid vua chen
                    sql = "select top 1 OrderID\n"
                            + "from dbo.Orders\n"
                            + "order by OrderID desc";
                    pst = cn.prepareStatement(sql);
                    ResultSet table = pst.executeQuery();
                    if (table != null && table.next()) {
                        int orderid = table.getInt("OrderID");
                        if (orderid > 0) {
                            //insert cac items vao orderdetail
                            for (Integer productId : giohang.keySet()) {
                                int quantity = giohang.get(productId);
                                double price = PDAO.getProduct(productId).getUnitPrice() * quantity;
                                sql = "INSERT INTO dbo.Order_Details (OrderID, ProductID, Quantity, UnitPrice) VALUES (?, ?, ?, ?)";
                                pst = cn.prepareStatement(sql);
                                pst.setInt(1, orderid);
                                pst.setInt(2, productId);
                                pst.setInt(3, quantity);
                                pst.setDouble(4, price);
                                result = pst.executeUpdate();
                            }

                        }
                    }

                }
                cn.commit();
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
        return result;
    }

    public int changeStatus(int orderID) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Orders]\n"
                        + "   SET [Status] = Status + 1 \n"
                        + " WHERE OrderID = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, orderID);
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

    public int CancelStatus(int orderID) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Orders]\n"
                        + "   SET [Status] = 4 \n"
                        + " WHERE OrderID = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, orderID);
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

    public ArrayList<Orders> listOrderOfCusID(int customerID) {
        ArrayList<Orders> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [OrderID]\n"
                        + "      ,[CustomerID]\n"
                        + "      ,[OrderDate]\n"
                        + "      ,[RequiredDate]\n"
                        + "      ,[ShippedDate]\n"
                        + "      ,[TotalProducts]\n"
                        + "      ,[ShipAddress]\n"
                        + "      ,[Status]\n"
                        + "  FROM [dbo].[Orders]"
                        + "where CustomerID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                //lay emai,password cua input params gan vao 2 cho ?
                pst.setInt(1, customerID);
                //run cau sql
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int OrderID = table.getInt("OrderID");
                        int CustomerID = table.getInt("CustomerID");
                        String OrderDate = sm.format(table.getDate("OrderDate"));
                        String RequiredDate = sm.format(table.getDate("RequiredDate"));
                        String ShippedDate = sm.format(table.getDate("ShippedDate"));
                        int totalProducts = table.getInt("TotalProducts");
                        String ShipAddress = table.getString("ShipAddress");
                        int status = table.getInt("Status");
                        Orders acc = new Orders(OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate, totalProducts, ShipAddress, status);
                        list.add(acc);
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

    public ArrayList<Orders> listOrdersByDateStartedDateEnd(String dateStarded, String dateEnded) {
        ArrayList<Orders> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT TOP (1000) o.[OrderID],\n"
                        + "                  o.[CustomerID],\n"
                        + "                  o.[OrderDate],\n"
                        + "                  o.[RequiredDate],\n"
                        + "                  o.[ShippedDate],\n"
                        + "                  o.[TotalProducts],\n"
                        + "                  o.[ShipAddress],\n"
                        + "                  o.[Status],\n"
                        + "                  od.TotalUnitPrice\n"
                        + "FROM [project_prj].[dbo].[Orders] AS o\n"
                        + "JOIN (\n"
                        + "    SELECT [OrderID], SUM([UnitPrice]) AS TotalUnitPrice\n"
                        + "    FROM [project_prj].[dbo].[Order_Details]\n"
                        + "    GROUP BY [OrderID]\n"
                        + ") AS od ON o.[OrderID] = od.[OrderID]\n"
                        + "WHERE o.[OrderDate] BETWEEN ? AND ? and o.[Status] = 3 \n"
                        + "ORDER BY od.TotalUnitPrice DESC;";
                PreparedStatement pst = cn.prepareStatement(sql);
                //lay emai,password cua input params gan vao 2 cho ?
                pst.setString(1, dateStarded);
                pst.setString(2, dateEnded);
                //run cau sql
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int OrderID = table.getInt("OrderID");
                        int CustomerID = table.getInt("CustomerID");
                        String OrderDate = sm.format(table.getDate("OrderDate"));
                        String RequiredDate = sm.format(table.getDate("RequiredDate"));
                        String ShippedDate = sm.format(table.getDate("ShippedDate"));
                        int totalProducts = table.getInt("TotalProducts");
                        String ShipAddress = table.getString("ShipAddress");
                        int status = table.getInt("Status");
                        Orders acc = new Orders(OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate, totalProducts, ShipAddress, status);
                        list.add(acc);
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

}
