package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DbManager;

public class Productdao {
    static DbManager dbm;

    public Productdao() {
        dbm = new DbManager();
    }
    
    public ArrayList<Products> getProductList() {
        Connection con = null;
        ArrayList<Products> products = new ArrayList<>();
        try {
            con = dbm.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM products");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setName(rs.getString("pname"));
                p.setPid(rs.getString("pid"));
                p.setCat_id(rs.getString("cat_id"));
                p.setPrice(rs.getString("price"));
                p.setDetails(rs.getString("details"));
                p.setInventory(rs.getString("inventory"));
                p.setImgurl(rs.getString("imgurl"));
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return products;
    }
    public Products getProductById(String pid) {
        Connection con = null;
        Products product = null;
        try {
            con = dbm.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM products WHERE pid=?");
            stmt.setString(1, pid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                product = new Products();
                product.setName(rs.getString("pname"));
                product.setPid(rs.getString("pid"));
                product.setCat_id(rs.getString("cat_id"));
                product.setPrice(rs.getString("price"));
                product.setDetails(rs.getString("details"));
                product.setInventory(rs.getString("inventory"));
                product.setImgurl(rs.getString("imgurl"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return product;
    }

    public int productupdate(String pname,String pid,String cat_id,String price,String details,String inventory,String imgurl) {
    	  int status = 0;
	try (Connection con = dbm.getConnection();
	             PreparedStatement stmt = con.prepareStatement("INSERT INTO products (pname, pid, cat_id, price, details, inventory,imgurl) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
				
				  stmt.setString(1, pname); stmt.setString(2, pid);
				  stmt.setString(3,cat_id); stmt.setString(4, price);
				  stmt.setString(5, details); stmt.setString(6, inventory);stmt.setString(7, imgurl);
				 
				  status = stmt.executeUpdate();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            
	        }
	return status;
	 }
    
    public int productdelete(String pid) {
    	int p=0;
    	 try (Connection con = dbm.getConnection();
    			  PreparedStatement stmt = con.
    			  prepareStatement("DELETE FROM products WHERE pid= ?"
    			  )) {
    			  
    			  stmt.setString(1, pid);  ResultSet rs =stmt.executeQuery();
    			  p++;
    }catch (SQLException e) { e.printStackTrace(); }
		return p;}
    
    
    public int inventoryupdate(String pid,String inventory) {
    	int p=0;
    try (Connection con = dbm.getConnection();
    			  PreparedStatement stmt = con.
    			  prepareStatement("UPDATE products SET inventory = ? WHERE pid= ?"
    			  )) {
    			  
    			  stmt.setString(1, inventory); stmt.setString(2, pid); ResultSet rs =
    			  stmt.executeQuery();
    			  
    			  p++;
    			  } catch (SQLException e) { e.printStackTrace(); }
	return p;}
	
	/*  public static void main(String[] args) { Productdao productDao = new
	  Productdao(); ArrayList<Products> productList = productDao.getProductList();
	  
	  for (Products product : productList) { System.out.println("Product: " +
	  product.getName() + ", Price: " + product.getPrice()+ ", Pid: " +
	  product.getPid()+ ", cat_id: " + product.getCat_id()+ ", details: " +
	  product.getDetails()+ ", inventory: " + product.getInventory()); } }
	  inventoryupdate("100001","10");
	 */
    
}
