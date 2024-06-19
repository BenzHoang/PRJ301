/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Suppliers;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Admins
 */
public class SupplierDAO {

    public ArrayList<Suppliers> getAllSuppliers() {
        ArrayList<Suppliers> suppliersList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Suppliers";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int supplierID = table.getInt("SupplierID");
                        String companyName = table.getString("CompanyName");
                        String address = table.getString("Address");
                        String phone = table.getString("Phone");
                        Suppliers suppliers = new Suppliers(supplierID, companyName, address, phone);
                       suppliersList.add(suppliers);
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
        return suppliersList;
    }

    public static void main(String[] args) {
            SupplierDAO SDAO = new SupplierDAO();
            System.out.println(SDAO.getAllSuppliers());
    }
}
