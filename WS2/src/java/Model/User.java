package Model;

public class User {

    private String userID;
    private String password;
    private String lastName;
    private boolean role;

    public User() {
        this.userID = null;
        this.password = null;
        this.lastName = null;
        this.role = false;
    }

    public User(String userID, String password, String lastName, boolean role) {
        this.userID = userID;
        this.password = password;
        this.lastName = lastName;
        this.role = role;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return String.format("UserID:%s, Password:%s, LastName:%s, Role:%d", userID, password, lastName, role);
    }

}
