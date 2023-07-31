package products;

public class Products {
	private String pid;
	private  String name;
	private  String price;
	private  String cat_id;
	private  String details;
	private  String  inventory;
	private String imgurl;
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	@Override
	public String toString() {
		return "Products [pid=" + pid + ", name=" + name + ", price=" + price + ", cat_id=" + cat_id + ", details="
				+ details + ", inventory=" + inventory + ", imgurl=" + imgurl + "]";
	}
}
