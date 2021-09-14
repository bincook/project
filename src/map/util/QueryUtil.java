package map.util;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.Collectors;

import com.mysql.jdbc.AssertionFailedException;

import map.dto.ClinicDto;

public class QueryUtil {
	
	// insert 쿼리 생성
	public static String getInsertQuery(Object model) {
		Assertions.assertNotNull(model,  "model is null");
		
		String table = getTable(model);
		if (StringUtil.hasText(table))
			return getInsertQuery(table, model);
		else 
			return null;
	}
	
	
	// delete 쿼리 생성
	public static String getDeleteQuery(Object model) {
		String table = getTable(model);
		Integer idValue = null;
		try {
			idValue = (int)getIdValue(model);
		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		}
			
			
		return getDeleteQuery(table, idValue);
	}
	
	// update 쿼리 생성
	public static String getUpdateQuery(Object model) {
		Assertions.assertNotNull(model,  "model is null");
		
		String table = getTable(model);
		String idName = getIdKey(model);
		Integer idValue = null;
		try {
			idValue = (int) getIdValue(model);
		} catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (StringUtil.hasText(table) && StringUtil.hasText(idName))
			return getUpdateQuery(table, idName, idValue, model);
		else 
			return null;
	}
	
	
	// 테이블 상세 정보를 가지고 쿼리를 가져옵니다.
	private static String getInsertQuery(String table, Object model) {
		

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
	
	

	// 테이블 상세 정보를 가지고 쿼리를 가져옵니다.
	private static String getDeleteQuery(String table, Integer id) {
		Assertions.assertNotNull(table,  "table is null");
		Assertions.assertNotNull(id,  "id is null");
		
		return "delete from `" + table + "` where id " + id;
	}
	

	
	// 테이블 상세 정보를 가지고 쿼리를 가져옵니다.
	private static String getUpdateQuery(String table, String idName, Integer id, Object model) {
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

	
	// 모델에 정의된 테이블 이름을 가져옵니다.
	private static String getTable(Object model) {
		
		return model.getClass().getAnnotation(Table.class).name();
	}
	
	// 모델에 정의된 아이디 필드명을 가져옵니다. 여러 필드가 Id 어노테이션을 가졌을 경우 처음 필드명 가져옵니다.
	private static String getIdKey(Object model) {
		return getIdField(model).getName();
	}
	
	// 모델에 정의된 아이디 필드 값을 가져옵니다. 여러 필드가 Id 어노테이션을 가졌을 경우 처음 필드값을 가져옵니다.
	private static Object getIdValue(Object model) throws IllegalArgumentException, IllegalAccessException {
		return getIdField(model).get(model);
	}
	
	// Id 어노테이션이 작성된 첫 아이디 필드를 가져옵니다.
	private static Field getIdField(Object model) {
		Field[] declaredFields = model.getClass().getDeclaredFields();
		
		return Arrays.stream(declaredFields).filter(field -> {
			field.setAccessible(true);
			if (field.getAnnotation(Id.class) != null)
				return false;
			else
				return true;
		}).collect(Collectors.toList()).get(0);
	}
	

}
