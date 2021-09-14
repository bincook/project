package clinic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import map.dto.ClinicDto;

public class ClinicReplyDao {

	Connection conn;
	
	public ClinicReplyDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://26.168.126.112:3306/guro_project_1";
		conn = DriverManager.getConnection(url,"hej","1234");
	}
	
	public void saveclinicreply(ClinicReplyDto clinicReplyDto) throws Exception {
		
		String sql ="insert into clinic_reply (content,email,writeday) values(?,?,now())";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, clinicReplyDto.getContent());
		pstmt.setString(2, clinicReplyDto.getEmail());
				
		pstmt.executeUpdate();
	}
	
	public List<ClinicReplyDto> findall() throws Exception
	{
		String sql ="select content,email,writeday from clinic_reply";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		List<ClinicReplyDto> result = new ArrayList<>();
				
		ResultSet rs = pstmt.executeQuery(sql);
		
		while (rs.next()) {
			ClinicReplyDto clinicReplyDto = new ClinicReplyDto();
			clinicReplyDto.setContent(rs.getString("content"));
			clinicReplyDto.setEmail(rs.getString("email"));
			clinicReplyDto.setWriteday(rs.getDate("writeday"));
			result.add(clinicReplyDto);
		}
		
		return result;
	}
}
