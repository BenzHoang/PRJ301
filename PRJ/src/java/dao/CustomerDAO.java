/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import mylib.DBUtils;

/**
 *
 * @author Admins
 */
public class CustomerDAO {

    public String getNameCusByCusID(int cusID) {
        String result = null;
        Connection cn = null;
        try {
            //make connection giua backend va sqlserver
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //viet sql va exec cau sql
                String sql = "SELECT [ContactName]\n"
                        + "  FROM [project_prj].[dbo].[Customers] where CustomerID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                //lay emai,password cua input params gan vao 2 cho ?
                pst.setInt(1, cusID);
                //run cau sql
                ResultSet table = pst.executeQuery();
                //doc data trong table
                if (table != null && table.next()) {
                    return result = table.getString("ContactName");
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

    public Customer getCustomerByAccId(int accId) {
        Customer result = null;
        Connection cn = null;
        try {
            //make connection giua backend va sqlserver
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //viet sql va exec cau sql
                String sql = "SELECT [CustomerID]\n"
                        + "      ,[ContactName]\n"
                        + "      ,[Address]\n"
                        + "      ,[Phone]\n"
                        + "      ,[AccountID]\n"
                        + "  FROM [project_prj].[dbo].[Customers] where AccountID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                //lay emai,password cua input params gan vao 2 cho ?
                pst.setInt(1, accId);
                //run cau sql
                ResultSet table = pst.executeQuery();
                //doc data trong table
                if (table != null && table.next()) {
                    result = new Customer(table.getInt("CustomerID"), table.getInt("AccountID"), table.getString("ContactName"), table.getString("Address"), table.getString("Phone"));
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
        CustomerDAO dao = new CustomerDAO();
        System.out.println(dao.getNameCusByCusID(1));
    }

    public int updateInfor(Customer cus) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Customers]\n"
                        + "   SET [ContactName] = ?  \n"
                        + "      ,[Address] = ?  \n"
                        + "      ,[Phone] = ?  \n"
                        + " WHERE AccountID = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, cus.getContactName());
                st.setString(2, cus.getAddress());
                st.setString(3, cus.getPhone());
                st.setInt(4, cus.getAccountID());
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
