package Model;

public class Mobile {

    private String mobileID;
    private String description;
    private float price;
    private String mobileName;
    private String producerName;
    private int yearOfProduction;
    private int quantity;
    private boolean notSale;

    public Mobile() {
    }

    public Mobile(String mobileID, String description, float price, String mobileName, String producerName, int yearOfProduction, int quantity, boolean notSale) {
        this.mobileID = mobileID;
        this.description = description;
        this.price = price;
        this.mobileName = mobileName;
        this.producerName = producerName;
        this.yearOfProduction = yearOfProduction;
        this.quantity = quantity;
        this.notSale = notSale;
    }

    public String getMobileID() {
        return mobileID;
    }

    public void setMobileID(String mobileID) {
        this.mobileID = mobileID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getMobileName() {
        return mobileName;
    }

    public void setMobileName(String mobileName) {
        this.mobileName = mobileName;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(int yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isNotSale() {
        return notSale;
    }

    public void setNotSale(boolean notSale) {
        this.notSale = notSale;
    }

    @Override
    public String toString() {
        return String.format("%s, %s, %.2f, %s, %s, %d, %d, %b", mobileID, description, price, mobileName, producerName, yearOfProduction, quantity, notSale);
    }

}
