package map.util;

public class StringUtil {
	public static boolean hasText(String str) {
		if (str == null)
			return false;
		
		if ("".equals(str))
			return false;
		
		return true;
	}
}
