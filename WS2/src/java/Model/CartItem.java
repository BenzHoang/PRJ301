package Model;

public class CartItem {

    private String itemId;
    private String itemName;
    private int quantity;
    private double price;

    public CartItem() {
    }

    public CartItem(String itemId, String itemName, int quantity, double price) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSubTotal() {
        return quantity * price;
    }

    @Override
    public String toString() {
        return String.format("%s, s, %d, %.2f", itemId, itemName, quantity, price);
    }
}
