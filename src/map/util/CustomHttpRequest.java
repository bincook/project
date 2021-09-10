package map.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class CustomHttpRequest {
	public static String request(String targetURL, String parameters, String authorization) {
		  
		HttpURLConnection connection = null;

		try {
		    //Create connection
		    URL url = new URL(targetURL);
		    connection = (HttpURLConnection) url.openConnection();
		    // ��û �޼ҵ忡 ���� GET,DELETE, PUT ������ �����Ͻø� �˴ϴ�.
		    connection.setRequestMethod("POST"); 
		    //Content-Type ���� ��û �޴� ������ Ÿ���� Json�̸� jsonŸ������ �������ֽø� �ǰ� 
		    // ���� ȯ�濡 ���� �������ֽø� �˴ϴ�. 
		    connection.setRequestProperty("Content-Type", 
		        "application/x-www-form-urlencoded");
		    // �ʿ��Ͻôٸ� �־��ּŵ� �ǰ� ���� ���� �ʿ���� ���̶� �����Ͽ����ϴ�. 
		    connection.setRequestProperty("Content-Length", 
		        Integer.toString(parameters.getBytes().length));
		    // �� �κ� ���� �ʿ��Ͻø� ������ּ���.
		    connection.setRequestProperty("Content-Language", "en-US");  
		    if (authorization != null) {
		    	connection.setRequestProperty("Authorization", authorization);  
		    }
	
		    connection.setUseCaches(false);// ĳ�̵����͸� ������ ���� �����մϴ�.
		    connection.setDoOutput(true); // �����带 �������� �����մϴ�.
	
		    //Send request
		    //������ ������ �������� �������� ��û�� �����ϴ�.
		    DataOutputStream wr = new DataOutputStream (
		        connection.getOutputStream());
		    //�Ķ���� ������ �����ϴ�.
		    wr.writeBytes(parameters);
		    //��û ������ dataOutputStream�� close �մϴ�.
		    wr.close();
	
		    //Get Response  
		    InputStream is = connection.getInputStream();
		    //��û ��� (response)�� BufferedReader�� �޽��ϴ�.
		    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
		    // �ڹ� 5 �̻��� StringBuffer �� �̿��ؼ� ��� ���� �н��ϴ�.
		    StringBuilder response = new StringBuilder(); 
		    String line;
		    while ((line = rd.readLine()) != null) {
		      response.append(line);
		      response.append('\r');
		    }
		    rd.close();
		    return response.toString();
		  } catch (Exception e) {
		    e.printStackTrace();
		    return null;
		  } finally {
		    if (connection != null) {
		      //������ ������� ��� ������ ������ connection ��ü (HttpURLConnection)�� 
		      // disconnect �Ͽ� ��� ������ �����մϴ�. 
		      connection.disconnect();
		    }
		  }
	}
}
