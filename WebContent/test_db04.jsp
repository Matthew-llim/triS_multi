<%@page import="static main.Single.*,
	org.apache.ibatis.session.SqlSession"%><%

String l = spring().getBean("sqlSession",SqlSession.class).selectOne("apple.sysdate");

%><%=l%><%-- test_db04.jsp --%>