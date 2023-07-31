package orders;

public class Orders {
	private String orderid;
	
	private  String userid;
	private  String price;
	private  String pid;
	private  String status;
	private  String  odate;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	@Override
	public String toString() {
		return "Orders [orderid=" + orderid + ", userid=" + userid + ", price=" + price + ", pid=" + pid + ", status="
				+ status + ", odate=" + odate + "]";
	}
}
