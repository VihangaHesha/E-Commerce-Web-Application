package lk.ijse.ecommercewebapplication.DTO;

public class Product {
    private int product_id;
    private int category_id;
    private String name;
    private String description;
    private double price;
    private int stock_quantity;
    private String image_url;
    private String created_at;

    @Override
    public String toString() {
        return "Product{" +
                "product_id=" + product_id +
                ", category_id=" + category_id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", stock_quantity=" + stock_quantity +
                ", image_url='" + image_url + '\'' +
                ", created_at='" + created_at + '\'' +
                '}';
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock_quantity() {
        return stock_quantity;
    }

    public void setStock_quantity(int stock_quantity) {
        this.stock_quantity = stock_quantity;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public Product(String created_at, String image_url, int stock_quantity, double price, String description, String name, int category_id, int product_id) {
        this.created_at = created_at;
        this.image_url = image_url;
        this.stock_quantity = stock_quantity;
        this.price = price;
        this.description = description;
        this.name = name;
        this.category_id = category_id;
        this.product_id = product_id;
    }

    public Product() {
    }
}
