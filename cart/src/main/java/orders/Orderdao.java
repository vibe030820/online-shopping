package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DbManager;

public class Orderdao {

	// private DbManager dbManager;
	public Orderdao() {
		dbManager = new DbManager();
	}

	public ArrayList<Orders> getOrderList() {
		ArrayList<Orders> orders = new ArrayList<>();
		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("SELECT * FROM orders");
				ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				Orders o = new Orders();
				o.setOrderid(rs.getString("orderid"));
				o.setUserid(rs.getString("userid"));
				o.setPid(rs.getString("pid"));
				o.setPrice(rs.getString("price"));
				o.setStatus(rs.getString("status"));
				o.setOdate(rs.getString("odate"));
				orders.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	private static DbManager dbManager;

	public static void userordercancellation(String orderid) {
		dbManager = new DbManager();
		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("DELETE FROM orders WHERE orderid= ?")) {

			stmt.setString(1, orderid);
			ResultSet rs = stmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void userordertracking(String orderid) {
		dbManager = new DbManager();
		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("SELECT status FROM orders WHERE orderid = ?")) {

			stmt.setString(1, orderid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				String status = rs.getString("status");
				System.out.println(status);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Orders> viewcart(String userid) {
		ArrayList<Orders> ordersList = new ArrayList<>();

		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con
						.prepareStatement("SELECT * FROM orders WHERE userid = ? AND status='in cart'")) {

			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String orderid = rs.getString("orderid");
				String pid = rs.getString("pid");
				String price = rs.getString("price");

				Orders order = new Orders();
				order.setOrderid(orderid);
				order.setPid(pid);
				order.setPrice(price);

				ordersList.add(order);
			}

			return ordersList;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<Orders> vieworders(String userid) {
		ArrayList<Orders> ordersList = new ArrayList<>();

		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con
						.prepareStatement("SELECT * FROM orders WHERE userid = ? ")) {
			/*
			 * ("SELECT * FROM orders WHERE userid = ? AND status='delivered'")
			 */			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String orderid = rs.getString("orderid");
				String pid = rs.getString("pid");
				String price = rs.getString("price");
				String status = rs.getString("status");

				Orders order = new Orders();
				order.setOrderid(orderid);
				order.setPid(pid);
				order.setPrice(price);
				order.setStatus(status);

				ordersList.add(order);
			}

			return ordersList;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}


	

	public int userorderupdate(String orderid, String userid, String pid, String price, String status, String odate) {
		int p=0;
		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"INSERT INTO orders (orderid, userid, pid, price, status, odate) VALUES (?, ?, ?, ?, ?, ?)")) {

			stmt.setString(1, orderid);
			stmt.setString(2, userid);
			stmt.setString(3, pid);
			stmt.setString(4, price);
			stmt.setString(5, status);
			stmt.setString(6, odate);

			 p = stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		}
		return p;
	}

	public static void userorderprice(String userid) {
		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con
						.prepareStatement("SELECT SUM(price) AS price FROM orders WHERE userid= ? ")) {
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				String price = rs.getString("price");
				System.out.println(price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int adminstatusupdate(String orderid, String status) {
		int p=0;
		dbManager = new DbManager();
		try (Connection con = dbManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("UPDATE orders SET status = ? WHERE orderid= ?")) {

			stmt.setString(1, status);
			stmt.setString(2, orderid);
			ResultSet rs = stmt.executeQuery();
p++;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	
	  public static void main(String[] args) { Orderdao orderDao = new Orderdao();
	  
	  ArrayList<Orders> orderList = orderDao.getOrderList();
	  
	  
		/*
		 * for (Orders order : orderList) { System.out.println("OrderId: " +
		 * order.getOrderid() + ", Price: " + order.getPrice() + ", ProductId: " +
		 * order.getPid() + ", UserId: " + order.getUserid() + ", Status: " +
		 * order.getStatus() + ", OrderDate: " + order.getOdate());
		 * userorderprice("000001"); adminstatusupdate("200001","delivered");
		 * userorderupdate("200002","000002","100001","999","ordered","27-may-2023"); }
		 */
	  
	  
	 System.out.println( orderDao. viewcart("000001")); }
	 

}
