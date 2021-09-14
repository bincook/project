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
		    // 요청 메소드에 따라서 GET,DELETE, PUT 등으로 변경하시면 됩니다.
		    connection.setRequestMethod("POST"); 
		    //Content-Type 또한 요청 받는 데이터 타입이 Json이면 json타입으로 선언해주시면 되고 
		    // 개발 환경에 따라 설정해주시면 됩니다. 
		    connection.setRequestProperty("Content-Type", 
		        "application/x-www-form-urlencoded");
		    // 필요하시다면 넣어주셔도 되고 저의 경우는 필요없는 값이라 제외하였습니다. 
		    connection.setRequestProperty("Content-Length", 
		        Integer.toString(parameters.getBytes().length));
		    // 이 부분 또한 필요하시면 사용해주세요.
		    connection.setRequestProperty("Content-Language", "en-US");  
		    if (authorization != null) {
		    	connection.setRequestProperty("Authorization", authorization);  
		    }
	
		    connection.setUseCaches(false);// 캐싱데이터를 받을지 말지 세팅합니다.
		    connection.setDoOutput(true); // 쓰기모드를 지정할지 세팅합니다.
	
		    //Send request
		    //위에서 세팅한 정보값을 바탕으로 요청을 보냅니다.
		    DataOutputStream wr = new DataOutputStream (
		        connection.getOutputStream());
		    //파라미터 정보를 보냅니다.
		    wr.writeBytes(parameters);
		    //요청 실행후 dataOutputStream을 close 합니다.
		    wr.close();
	
		    //Get Response  
		    InputStream is = connection.getInputStream();
		    //요청 결과 (response)를 BufferedReader로 받습니다.
		    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
		    // 자바 5 이상은 StringBuffer 를 이용해서 결과 값을 읽습니다.
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
		      //에러와 관계없이 모든 로직이 끝나면 connection 객체 (HttpURLConnection)를 
		      // disconnect 하여 모든 연결을 종료합니다. 
		      connection.disconnect();
		    }
		  }
	}
}
