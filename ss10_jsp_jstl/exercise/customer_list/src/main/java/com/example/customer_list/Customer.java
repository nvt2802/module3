public class Customer {
    private String namme;
    private String dateOfBirth;
    private String address;
    private String img;

    public Customer() {
    }

    public Customer(String namme, String dateOfBirth, String address, String img) {
        this.namme = namme;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.img = img;
    }

    public String getNamme() {
        return namme;
    }

    public void setNamme(String namme) {
        this.namme = namme;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
