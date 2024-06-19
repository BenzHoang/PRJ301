/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
public class productDAO {

    CategoryDAO CDAO = new CategoryDAO();



    public ArrayList<Product> pagingProducts( int categoryID) {
        ArrayList<Product> productsList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from [dbo].Products where CategoryID =? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, categoryID);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int productID = table.getInt("ProductID");
                        String productName = table.getString("ProductName");
                        int supplierID = table.getInt("SupplierID");
                        Category category = CDAO.getCategoryByID(table.getInt("CategoryID"));
                        double UnitPrice = table.getDouble("UnitPrice");
                        String productImage = table.getString("ProductImage");
                        String desciption = table.getString("Desciption");
                        Product product = new Product(productID, productName, supplierID, category, UnitPrice, productImage, desciption);
                        productsList.add(product);
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
        return productsList;
    }

    public int removeProductByID(int id) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "delete from [dbo].Products\n"
                        + " where ProductID=?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, id);
                result = st.executeUpdate();
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

    public Product getProduct(int id) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from [dbo].Products  where ProductID =? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet table = pst.executeQuery();
                if (table != null && table.next()) {
                    int productID = table.getInt("ProductID");
                    String productName = table.getString("ProductName");
                    int supplierID = table.getInt("SupplierID");
                    Category category = CDAO.getCategoryByID(table.getInt("CategoryID"));
                    double UnitPrice = table.getDouble("UnitPrice");
                    String productImage = table.getString("ProductImage");
                    String desciption = table.getString("Desciption");
                    Product product = new Product(productID, productName, supplierID, category, UnitPrice, productImage, desciption);
                    return product;
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
        return null;
    }

    public int createProduct(String name, int supplierID, int categoryID, double unitPrice, String imagePath, String description) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Insert into [dbo].[Products] ("
                        + "[ProductName]"
                        + ",[SupplierID]"
                        + ",[CategoryID]"
                        + ",[UnitPrice]"
                        + ",[ProductImage]"
                        + ",[Desciption])"
                        + "  values (?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, supplierID);
                pst.setInt(3, categoryID);
                pst.setDouble(4, unitPrice);
                pst.setString(5, imagePath);
                pst.setString(6, description);
                result = pst.executeUpdate();
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

    public int updateProduct(String name, int supplierID, int categoryID, double unitPrice, String imagePath, String description, int productID) {
        int result = -1;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[Products]\n"
                        + "   SET [ProductName] = ?\n"
                        + "      ,[SupplierID] = ?\n"
                        + "      ,[CategoryID] = ?\n"
                        + "      ,[UnitPrice] = ?\n"
                        + "      ,[ProductImage] = ?\n"
                        + "      ,[Desciption] = ?\n"
                        + " WHERE ProductID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, supplierID);
                pst.setInt(3, categoryID);
                pst.setDouble(4, unitPrice);
                pst.setString(5, imagePath);
                pst.setString(6, description);
                pst.setInt(7, productID);
                result = pst.executeUpdate();
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
        productDAO dao = new productDAO();
        System.out.println(dao.getAllProduct());
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> productsList = new ArrayList<>();
        CategoryDAO caDAO = new CategoryDAO();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [ProductID]\n"
                        + "      ,[ProductName]\n"
                        + "      ,[SupplierID]\n"
                        + "      ,[CategoryID]\n"
                        + "      ,[UnitPrice]\n"
                        + "      ,[ProductImage]\n"
                        + "      ,[Desciption]\n"
                        + "  FROM [project_prj].[dbo].[Products]";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int productID = table.getInt("ProductID");
                        String productName = table.getString("ProductName");
                        int supplierID = table.getInt("SupplierID");
                        Category category = caDAO.getCategoryByID(table.getInt("CategoryID"));
                        double UnitPrice = table.getDouble("UnitPrice");
                        String productImage = table.getString("ProductImage");
                        String description = table.getString("Desciption") == null ? "" : table.getString("Desciption");
                        Product product = new Product(productID, productName, supplierID, category, UnitPrice, productImage, description);
                        productsList.add(product);
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
        return productsList;
    }

            

    public ArrayList<Product> getProducts(String findName) {
        ArrayList<Product> productsList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from [dbo].Products where ProductName  like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + findName + "%");
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int productID = table.getInt("ProductID");
                        String productName = table.getString("ProductName");
                        int supplierID = table.getInt("SupplierID");
                        Category category = CDAO.getCategoryByID(table.getInt("CategoryID"));
                        double UnitPrice = table.getDouble("UnitPrice");
                        String productImage = table.getString("ProductImage");
                        String description = table.getString("Desciption") == null ? "" : table.getString("Desciption");
                        Product product = new Product(productID, productName, supplierID, category, UnitPrice, productImage, description);
                        productsList.add(product);
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
        return productsList;
    }
}
