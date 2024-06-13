package servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/collectData")
public class CollectData extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String month = req.getParameter("month"); //fetching month from front-end	
		
		Part part = req.getPart("img"); //fetching the image file from front-end
		String img_name = part.getSubmittedFileName(); //get the image file name
		
		String query = "insert into data (month,img_name) values(?,?)"; //query to insert data into table
		
		String uploadPath = "D:/JSpiders/EclipseWorkSpace/Rent_System/src/main/webapp/Screenshot/"+img_name; //path file to upload image in Screenshot folder
		
		//Uploading selected image file to the Screenshot folder
		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = part.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		//Connecting to Database	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rent_system", "root", "Unosnist@397");
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,month);
			ps.setString(2, img_name);
			int row = ps.executeUpdate();
			if(row!=0)
			{
				System.out.println("Data saved!!");	
				
			}
			else
				System.out.println("Failure!!");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("DisplayData.jsp");
		rd.forward(req, resp);
	}
}
