<%@ page contentType="text/plain; charset=utf-8"
    pageEncoding="EUC-KR"%><%

String no = request.getParameter("no");
System.out.println( no );    
    
%>{
	'data' : [
		{ 'no' : 1, 'content' : 'apple'},
		{ 'no' : 2, 'content' : 'banana'},
		{ 'no' : 3, 'content' : 'orange'},
		{ 'no' : 4, 'content' : 'kiwi'},
		{ 'no' : 5, 'content' : 'tomato'},
		{ 'no' : 6, 'content' : 'potato'}
	]
}
