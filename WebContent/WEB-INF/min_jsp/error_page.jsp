<%@ page language="java" contentType="text/plain; charset=utf-8"
    pageEncoding="EUC-KR"%>${err}<%
    
    
    StackTraceElement[] stes = (StackTraceElement[])request.getAttribute("stes");
    
    for(StackTraceElement ste : stes ){
    	%><%=ste.toString()+"\r\n"%><%
    }
    
    %>