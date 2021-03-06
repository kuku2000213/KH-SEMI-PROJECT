package customer.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import customer.model.vo.Customer;
import member.model.dao.MemberDAO;

public class CustomerDAO {
	
	private Properties prop = new Properties();
	
	public CustomerDAO() {
		String fileName = CustomerDAO.class.getResource("/sql/customer/customer-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Customer c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCustomer");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getEmail());
			pstmt.setString(2, c.getAge());
			pstmt.setString(3, c.getSkintype());
			pstmt.setString(4, c.getGender());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
