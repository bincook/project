package map.util;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.Collectors;

import com.mysql.jdbc.AssertionFailedException;

import map.dto.ClinicDto;

public class QueryUtil {
	public static String getInsertQuery(String table, Object model) {
		

		Assertions.assertNotNull(table,  "table is null");
		
		Field[] declaredFields = model.getClass().getDeclaredFields();
		
		StringBuffer columns = new StringBuffer();
		StringBuffer values = new StringBuffer();
		
		int index = 0;
		int size = 	Arrays.stream(declaredFields).filter(field -> {
						field.setAccessible(true);
						if (field.getAnnotation(Ignore.class) != null)
							return false;
						else
							return true;
					}).collect(Collectors.toList()).size();
		
		try {
			for (Field field : declaredFields) {
				
				field.setAccessible(true);
				
				if (field.getAnnotation(Ignore.class) != null)
					continue;
				
				index++;
				Object value = null;
				value = field.get(model);
				Class<?> clazz = field.getType();
				
				
				
				columns.append(field.getName());
				if (value == null) {
					values.append("null");
				} else if (clazz == Integer.class || clazz == Double.class || clazz == Float.class) {
					values.append(value);
				} else {
					values.append("'");
					values.append(value);
					values.append("'");
				}
				
				if (index != size) {
					columns.append(",");
					values.append(",");
				}
				
			}

		} catch (IllegalArgumentException | IllegalAccessException e) {
			return null;
		}
		
		return " insert into `" + table + "` ( " + columns.toString() + " ) values (" + values.toString() + ")";
	}
	
	public static String getDeleteQuery(String table, Integer id) {
		Assertions.assertNotNull(table,  "table is null");
		Assertions.assertNotNull(id,  "id is null");
		
		return "delete from `" + table + "` where id " + id;
	}
	
	public static String getUpdateQuery(String table, String idName, Integer id, Object model) {
		Assertions.assertNotNull(table,  "table is null");
		Assertions.assertNotNull(id,  "id is null");
		Assertions.assertNotNull(idName,  "id name is null");
		
		Field[] declaredFields = model.getClass().getDeclaredFields();
		
		StringBuffer keyPair = new StringBuffer();
		
		int index = 0;
		int size = 	Arrays.stream(declaredFields).filter(field -> {
			field.setAccessible(true);
			if (field.getAnnotation(Ignore.class) != null)
				return false;
			else
				return true;
		}).collect(Collectors.toList()).size();
		
		try {
			for (Field field : declaredFields) {
				field.setAccessible(true);
				
				if (field.getAnnotation(Ignore.class) != null)
					continue;
				
				index++;
				Object value = null;
				value = field.get(model);
				Class<?> clazz = field.getType();
				
				keyPair.append(field.getName());
				keyPair.append("=");
				if (value == null) {
					keyPair.append("null");
				} else if (clazz == Integer.class || clazz == Double.class || clazz == Float.class) {
					keyPair.append(value);
				} else {
					keyPair.append("'");
					keyPair.append(value);
					keyPair.append("'");
				}
				
				if (index != size) {
					keyPair.append(",");
				}
				
			}

		} catch (IllegalArgumentException | IllegalAccessException e) {
			return null;
		}
		
		return " update `" + table + "` set " + keyPair.toString() + " where " + idName + "=" + id;
	}

	

}
