package com.matwx.utilities;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;


@Component
public class DatabaseCrud<C> {
	
	// Session References

	// session.get(Student.class,1);
	// session.save(student);
	// session.persist(student);
	// session.delete(student);
	
	/**
	 * HQL Queries
	 */
	
	// https://www.tutorialspoint.com/hibernate/hibernate_query_language.htm
	// https://stackoverflow.com/questions/1239723/how-do-you-do-a-limit-query-in-jpql-or-hql
	@SuppressWarnings("unchecked")
	public List<String> simpleSelectStatement(Session session, String className) {
		Query<String> query = session.createQuery("FROM " + className);
//		query.setMaxResults(0);
		return query.getResultList();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<String> selectWhere1Column(Session session, String className, String columnName, String value) {
		Query<String> query = session.createQuery("FROM " + className + " where " + columnName + " = :" + columnName);
		query.setParameter(columnName, value);
		return query.getResultList();
	}
	

	@SuppressWarnings("unchecked")
	public List<String> selectWhere2Column(Session session, String className, String columnName1, String columnName2,String value1,String value2) {

		Query<String> query = session.createQuery("FROM " + className + " where " + columnName1 + " = '" + value1 + "' and " + columnName2 + " = '" + value2 + "'");
//		query.setMaxResults(0);
		return query.getResultList();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<String> selectWhere3Column(Session session, String className, String columnName1, String columnName2, String columnName3, String value1, String value2, String value3) {
		
		Query<String> query = session.createQuery("FROM " + className + " where " + columnName1 + " = '" + value1 + "' and " + columnName2 + " = '" + value2 + "'" + " and " + columnName3 + " = '" + value3 + "'");
//		query.setMaxResults(0);
		return query.getResultList();
	}
	
	
	public int updateTableWhereCol(Session session, String className, String columnName, String value, String whereColumn, String whereValue) {

		return session.createQuery("update " + className + " set " + columnName + " = '" + value + "' where "
				+ whereColumn + " = '" + whereValue + "'").executeUpdate();
	}
	
	
	
	
	public int deleteTableWhereCol(Session session, String className, String columnName, String value) {
		return session.createQuery("delete from " + className + " where " + columnName + " = " + value).executeUpdate();
	}
	
	
	
	
	
	
	
	/*
	 * CRITERIA QUERIES
	 */
	
	
//	@SuppressWarnings("unchecked")
//	public List<Student> selectWhere1Column(Session session, Class<C> c, String column1, String value1) {
//
//		CriteriaBuilder cb = session.getCriteriaBuilder();
//
//		CriteriaQuery<Student> cr = (CriteriaQuery<Student>) cb.createQuery(c);
//		
//		Root<Student> root = (Root<Student>) cr.from(c);
//		
//		cr.select(root).where(cb.like(root.get(column1), value1));
//		
//		Query<Student> query = session.createQuery(cr);
//		
////		query.setMaxResults(0);
//		
//		return query.getResultList();
//	}
	
	
	
	// https://stackoverflow.com/questions/4872978/how-do-i-pass-a-class-as-a-parameter-in-java
	// https://www.baeldung.com/hibernate-criteria-queries
//	@SuppressWarnings("unchecked")
//	public List<Student> selectWhere2Column(Session session, Class<C> c, String column1, String column2, String value1, String value2) {
//
//		CriteriaBuilder cb = session.getCriteriaBuilder();
//
//		CriteriaQuery<Student> cr = (CriteriaQuery<Student>) cb.createQuery(c);
//		
//		Root<Student> root = (Root<Student>) cr.from(c);
//		
//		cr.select(root).where(cb.like(root.get(column1), value1));
//		
//		cr.select(root).where(cb.like(root.get(column2), value2));
//		
//		Query<Student> query = session.createQuery(cr);
//		
////		query.setMaxResults(0);
//		
//		return query.getResultList();
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
