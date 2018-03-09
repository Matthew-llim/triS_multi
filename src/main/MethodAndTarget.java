package main;

import java.lang.annotation.Annotation;

import java.lang.reflect.Method;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static main.BeanUtil.*;

class MethodAndTarget 
{
	Object doIt() throws Exception {
		return method.invoke(target);
	}

	Object doIt( ServletContext application,
		ServletConfig config,
		HttpServletRequest request, 
		HttpServletResponse response) throws Exception 
	{
		Class<?>[] ptypes = method.getParameterTypes();
		Object[] args = new Object[ptypes.length];
		
		Annotation[][] as = method.getParameterAnnotations();
		
		for( int i = 0 ; i < ptypes.length ; i++ ){
			if( ptypes[i] == HttpServletRequest.class ){
				args[i] = request;
			} else if( ptypes[i] == HttpServletResponse.class ){
				args[i] = response;
			} else if( ptypes[i] == HttpSession.class ){
				args[i] = request.getSession();
			} else if( ptypes[i] == ServletContext.class ){
				args[i] = application;
			} else if( ptypes[i] == ServletConfig.class ){
				args[i] = config;
			} else {
				Annotation[] as2 = as[i];
				if( as2 == null || as2.length == 0 ){
					continue;
				} else if( as2.length > 1 ) {
					throw new RuntimeException("매개변수 어노테이션 중복금지");
				} 
				else if( as2[0] instanceof RequestParam ){
					RequestParam rp = (RequestParam)as2[0];
					
					String value = request.getParameter( rp.value() );
					if( ptypes[i] == String.class ) {
						if( isPropertyNeedUTF( rp.value() ) ){
							value = utf2kr( value );
						}
						args[i] = ( value );
					} else if ( ptypes[i] == Integer.class ) {
						args[i] = pInt( value );
					} else if ( ptypes[i] == Double.class ) {
						args[i] = pDbl( value );
					} else if ( ptypes[i] == int.class ) {
						args[i] = pInt( value, 0 );
					} else if ( ptypes[i] == double.class ) {
						args[i] = pDbl( value, 0.0 );
					} 
					else 
					{	//	@RequestParam("name") TempVO pvo 식으로 쓸때
						String sn = toSetterName( rp.value() );

						Method m = ptypes[i].getMethod(sn, String.class);
						if( m != null ){
							Object obj = ptypes[i].newInstance();
							if( isPropertyNeedUTF( rp.value() ) ){
								value = utf2kr( value );
							}
							m.invoke(obj, value );
							args[i] = obj;
							continue;
						}						
						
						m = ptypes[i].getMethod(sn, Integer.class);
						if( m != null ){
							Object obj = ptypes[i].newInstance();
							m.invoke(obj, pInt( value ) );
							args[i] = obj;
							continue;
						}
						
						m = ptypes[i].getMethod(sn, Double.class);
						if( m != null ){
							Object obj = ptypes[i].newInstance();
							m.invoke(obj, pDbl( value ) );
							args[i] = obj;
							continue;
						}
					}
				}
				else if( as2[0] instanceof CookieValue ){
					CookieValue cv = (CookieValue)as2[0];
					String val = cv.value();
					
					Cookie[] cks = request.getCookies();
					if( cks != null ){
						for( int t = 0 ; t < cks.length ; t++ ){
							if( val.equals( cks[t].getName() ) ){
								args[i] = cks[t].getValue();
								break;
							}
						}
					}
				}
				else if( as2[0] instanceof ModelAttribute ) 
				{
					Object obj = ptypes[i].newInstance();
					populate(obj, request);
					args[i] = obj;
				}
			}
		}
		return method.invoke(target, args);
	}
	
	MethodAndTarget(Method method, Object target) {
		this.method = method;
		this.target = target;
	}
	
	@SuppressWarnings({"unchecked","rawtypes"})
	public boolean hasAnnotation( Class cls ){
		if( method != null && cls != null ){
			return ( method.getAnnotation(cls) != null );
		}
		return false;
	}
	
	private Method method = null;
	private Object target = null;
}