package map.util;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.Collectors;

import com.mysql.jdbc.AssertionFailedException;

import map.dto.ClinicDto;

public class QueryUtil {
	
	// insert ���� ����
	public static String getInsertQuery(Object model) {
		Assertions.assertNotNull(model,  "model is null");
		
		String table = getTable(model);
		if (StringUtil.hasText(table))
			return getInsertQuery(table, model);
		else 
			return null;
	}
	
	
	// delete ���� ����
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
	
	// update ���� ����
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
	
	
	// ���̺� �� ������ ������ ������ �����ɴϴ�.
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
	
	

	// ���̺� �� ������ ������ ������ �����ɴϴ�.
	private static String getDeleteQuery(String table, Integer id) {
		Assertions.assertNotNull(table,  "table is null");
		Assertions.assertNotNull(id,  "id is null");
		
		return "delete from `" + table + "` where id " + id;
	}
	

	
	// ���̺� �� ������ ������ ������ �����ɴϴ�.
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

	
	// �𵨿� ���ǵ� ���̺� �̸��� �����ɴϴ�.
	private static String getTable(Object model) {
		
		return model.getClass().getAnnotation(Table.class).name();
	}
	
	// �𵨿� ���ǵ� ���̵� �ʵ���� �����ɴϴ�. ���� �ʵ尡 Id ������̼��� ������ ��� ó�� �ʵ�� �����ɴϴ�.
	private static String getIdKey(Object model) {
		return getIdField(model).getName();
	}
	
	// �𵨿� ���ǵ� ���̵� �ʵ� ���� �����ɴϴ�. ���� �ʵ尡 Id ������̼��� ������ ��� ó�� �ʵ尪�� �����ɴϴ�.
	private static Object getIdValue(Object model) throws IllegalArgumentException, IllegalAccessException {
		return getIdField(model).get(model);
	}
	
	// Id ������̼��� �ۼ��� ù ���̵� �ʵ带 �����ɴϴ�.
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
