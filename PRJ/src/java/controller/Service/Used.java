/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Service;

import dao.CustomerDAO;
import dao.OrderDetailsDAO;
import dao.OrdersDAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import javax.servlet.http.Part;

public class Used {

    OrdersDAO orDAO = new OrdersDAO();
    CustomerDAO Cusdao = new CustomerDAO();
    OrderDetailsDAO detailDao = new OrderDetailsDAO();
    public double TotalByOrderID(int orderID) {
        return orDAO.getAllTotalByOrderId(orderID);
    }

    public String NameCusByIdCus(int CusID) {
        return Cusdao.getNameCusByCusID(CusID);
    }
    public int ChangeStatusByOrderID(int orderID){
        return orDAO.changeStatus(orderID);
    }
    public int CancelByOrderID(int orderID){
        return orDAO.CancelStatus(orderID);
    }

    public static String uploadIMAGE(Part filePart, String webpath, String savePath, String displayPath) {
        String lastPathIMG = null;
        String folderName = webpath + savePath;
        String imagePathDisplay = displayPath + savePath;
        File file = new File(folderName);
        if (!file.exists()) {
            file.mkdirs();
        }
        String fileExtension = filePart.getSubmittedFileName().substring(filePart.getSubmittedFileName().lastIndexOf("."));
        String newFileName = "image_" + UUID.randomUUID().toString() + fileExtension;
        String contentType = filePart.getContentType();
        Path filePath = Paths.get(folderName + File.separator + newFileName);
        Path displayFilePath = Paths.get(imagePathDisplay + File.separator + newFileName);
        String imagePathSave = "/" + savePath + "/" + newFileName;
        if (contentType.startsWith("image/") && filePart.getSize() <= 1024 * 1024 * 10) {
            try {
                filePart.write(displayFilePath.toString());
                Files.copy(displayFilePath, filePath);
            } catch (Exception e) {
                e.printStackTrace();
                return lastPathIMG;
            }
            lastPathIMG = imagePathSave;
            return lastPathIMG;

        } else {
            return lastPathIMG;
        }
    }

    public static boolean deleteExistImage(String petIMGpath) {
        // create object of Path 
        Path path = Paths.get(petIMGpath);
        // deleteIfExists File 
        try {

            Files.deleteIfExists(path);
            return true;
        } catch (IOException e) {

            // TODO Auto-generated catch block 
            e.printStackTrace();
            return false;
        }
    }

    public int UpdateOrderDetail(int orderID, int productID, int quantity) {
        return detailDao.updateOrderDetail( orderID, productID,quantity);
    }
}
