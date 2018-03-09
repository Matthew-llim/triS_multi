package main;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.ModelAndView;
import main.ViewResolver;

import static main.Single.*;

public class DispatcherServlet extends HttpServlet 
{
	@Override 
	public void service(HttpServletRequest request, 
		HttpServletResponse response) 
		throws ServletException, IOException 
	{
		String ctxPath = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.substring(ctxPath.length());
		
		Map<String,MethodAndTarget> methodMap = spring()
			.getBean("mapping",MethodAndTargetMap.class)
			.getMapping();
		
		MethodAndTarget mnt = methodMap.get(uri);
		if( mnt != null ){
			try {
				Object obj = mnt.doIt(application,config,
					request,response);
				if( obj == null ){
					return;
				}
				else if( obj instanceof String )
				{
					if( mnt.hasAnnotation(ResponseBody.class) ) 
					{
/*						String responseText = obj.toString();
						try{
							byte[] bs = responseText.getBytes("euc-kr");
							responseText = new String(bs,"utf-8");
						}
						catch( Exception e ){}
						response.setContentType("text/plain;charset=utf-8");
						PrintWriter out = response.getWriter();
						out.print( responseText );
						out.flush();
						out.close();
*/
						String responseText = obj.toString();
						
						response.setContentType("text/plain; charset=utf-8");
						response.setCharacterEncoding("utf-8");
						
						OutputStream out = response.getOutputStream();
						out.write( responseText.getBytes("utf-8") );
						out.flush();
						out.close();
						
					}
					else
					{
						String viewName = obj.toString();
						if( viewName.startsWith("redirect:") ) {
							String l = ctxPath + viewName.substring(9);
							response.sendRedirect( l );
						}
						else {
							ViewResolver vr = spring().getBean("viewResolver",
								ViewResolver.class);
							String l = vr.getPrefix() + viewName + vr.getSuffix();
							
							RequestDispatcher rd = request.getRequestDispatcher( l );
							rd.forward(request, response);
						}						
					}
				}
				else if( obj instanceof ModelAndView )
				{
					ModelAndView mnv = (ModelAndView)obj;
					String viewName = mnv.getViewName();
					if( viewName == null ) {
						return;
					} else if( viewName.startsWith("redirect:") ) {
						String l = ctxPath + viewName.substring(9);
						response.sendRedirect( l );
					} else {
						ViewResolver vr = spring().getBean("viewResolver",
							ViewResolver.class);
						String l = vr.getPrefix() + viewName + vr.getSuffix();
						
						mnv.fill( request );

						RequestDispatcher rd = request.getRequestDispatcher( l );
						rd.forward(request, response);
					}
				}
			} 
			catch (Throwable e) 
			{
				Throwable e2 = null;
				while( ( e2 = e.getCause() ) != null ){
					e = e2;
				}
				
				e.printStackTrace();
				
				request.setAttribute("err",e.toString()+"\r\n\r\n" );
				request.setAttribute("stes", e.getStackTrace());

				ViewResolver vr = spring().getBean("viewResolver",
					ViewResolver.class);
				String l = vr.getPrefix() + "error_page" + vr.getSuffix();

				RequestDispatcher rd = request.getRequestDispatcher( l );
				rd.forward(request, response);
			}
		}
	}

	private ServletConfig config = null;
	private ServletContext application = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config = config;
		application = config.getServletContext();
	}
}