package map.util;

import com.mysql.jdbc.AssertionFailedException;

public class Assertions {
	public static void assertTrue(boolean isTrue) {
		if (isTrue)
			throw new AssertionFailedException(new RuntimeException("assert exception"));

	}
	
	public static void assertTrue(boolean isTrue, String message) {
		if (isTrue)
			throw new AssertionFailedException(new RuntimeException(message));
	}
	
	public static void assertNotNull(Object object) {
		if (object == null) 
			throw new AssertionFailedException(new RuntimeException("value is null!!"));
	}
	
	public static void assertNotNull(Object object, String message) {
		if (object == null) 
			throw new AssertionFailedException(new RuntimeException(message));
	}
}
