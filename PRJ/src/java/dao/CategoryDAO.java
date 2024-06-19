/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Category;
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
public class CategoryDAO {

    public Category getCategoryByID(int ID) {
        Category category = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Categories where CategoryID=? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                ResultSet table = pst.executeQuery();
                if (table != null && table.next()) {
                    int categoryID = table.getInt("CategoryID");
                    String categoryName = table.getString("CategoryName");
                    String description = table.getString("Description");
                    category = new Category(categoryID, categoryName, description);
                }
            } else {
                throw new Exception();
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
        return category;
    }

    public ArrayList<Category> getAllCategorys() {
        ArrayList<Category> categoryList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Categories";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int categoryID = table.getInt("CategoryID");
                        String categoryName = table.getString("CategoryName");
                        String description = table.getString("Description");
                        Category category = new Category(categoryID, categoryName, description);
                        categoryList.add(category);
                    }
                }
            } else {
                throw new Exception();
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
        return categoryList;
    }

    public static void main(String[] args) {
        SupplierDAO SDAO = new SupplierDAO();
        System.out.println(SDAO.getAllSuppliers());
    }
}
