package main;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, 
		FilterChain filterChain) throws IOException, ServletException 
	{
		System.out.println("doFilter");
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		
		String uri = request.getRequestURI();
		
		String ctxPath = request.getContextPath();
		uri = uri.substring( ctxPath.length() );

		
		
		System.out.println(uri);
		
		if(uri.equals("/main.do") || uri.equals("/main.html") || uri.equals("/main_html.do") || uri.equals("/home_moveLoginPage.do") 
		|| uri.equals("/home_login.do")  || uri.equals("/best_space.do") ||   uri.equals("/best_space2.do")
		||   uri.equals("/best_club.do")
		||   uri.equals("/best_community.do")||   uri.equals("/chk_login.do") ||   uri.equals("/Resources/css/bootstrap.css")||   uri.equals("/Resources/css/reset.css")
		||   uri.equals("/Resources/css/responsive.css")

				){
			// uri 에 login이 필요하지 않은 페이지 모두 넣어줘야함.
			filterChain.doFilter(arg0, arg1);
		}
		
		// ******** uri 가 main_html.do 이거나 home_moveLoginPage.do 이면 
		// filterChain의 doFilter() 함수가 동작 : 어떤 페이지를 가더라도 doFilter 함수가 실행됨. 
		
		else{ // 로그인이 필요한 do 로 가면
			boolean hasLoginInfo = false;
			
			Cookie[] cks = request.getCookies(); //쿠키들을 가져옴
			if( cks != null ){
				for( int i = 0 ; i < cks.length ; i++ ){
					String name = cks[i].getName(); //쿠키 이름
					String value = cks[i].getValue(); //쿠키 값
					
					if( name.equals("user_id") ){
						hasLoginInfo = true;
						request.setAttribute("user_id", value );
						break;
					}
				}
			}
			
			if( hasLoginInfo ){
				filterChain.doFilter(arg0, arg1);
			}
			else{
			
				response.sendRedirect( ctxPath + "/home_moveLoginPage.do");
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
