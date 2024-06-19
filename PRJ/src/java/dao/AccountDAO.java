/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import dto.Category;
import dto.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Admins
 */
public class AccountDAO {

    public Account getAccount(String user1) {
        Account result = null;
        Connection cn = null;
        try {
            //make connection giua backend va sqlserver
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //viet sql va exec cau sql
                String sql = "SELECT [AccountID]\n"
                        + "      ,[UserName]\n"
                        + "      ,[Password]\n"
                        + "      ,[Type]\n"
                        + "  FROM [project_prj].[dbo].[Account] where UserName = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                //lay emai,password cua input params gan vao 2 cho ?
                pst.setString(1, user1);
                //run cau sql
                ResultSet table = pst.executeQuery();
                //doc data trong table
                if (table != null && table.next()) {
                    result = new Account(table.getInt("AccountID"), table.getString("UserName"), table.getString("Password"), table.getInt("Type"));
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
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.updatePass(new Account().builder().accountID(1).password("1").build()));
        
    }

    public int register(Account register) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO [dbo].[Account]\n"
                        + "           ([UserName]\n"
                        + "           ,[Password]\n"
                        + "           ,[Type])\n"
                        + "     VALUES\n"
                        + "           (?, ? ,? )";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, register.getUserName());
                st.setString(2, register.getPassword());
                st.setInt(3, register.getType());
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

    public ArrayList<Account> listCustomer() {
        ArrayList<Account> accountsList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [AccountID]\n"
                        + "      ,[UserName]\n"
                        + "      ,[Password]\n"
                        + "      ,[Type]\n"
                        + "  FROM [project_prj].[dbo].[Account]";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int accountID = table.getInt("AccountID");
                        String UserName = table.getString("UserName");
                        String password = table.getString("Password");
                        int Type = table.getInt("Type");
                        accountsList.add(new Account(accountID, UserName, password, Type));
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
        return accountsList;
    }

    public int deleteAccount(String username) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "DELETE FROM [dbo].[Account]\n"
                        + " WHERE UserName = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, username);
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

    public int updatePass(Account acc) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Account]\n"
                        + "   SET Password = ? where AccountID = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, acc.getPassword());
                st.setInt(2, acc.getAccountID());
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
