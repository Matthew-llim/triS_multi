package main;

import java.lang.reflect.Method;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Single 
{
	private static ApplicationContext spring = null;
	
	public static synchronized ApplicationContext spring(){
		if( spring == null ){
			try{
				ApplicationContext spring2 = new ClassPathXmlApplicationContext("main/spring.xml");
				
				//	MethodAndTargetMap의 초기화 작업을 여기서 진행한다.
				Map<String,MethodAndTarget> methodMap = spring2
					.getBean("mapping",MethodAndTargetMap.class)
					.getMapping();
				String[] names = spring2.getBeanDefinitionNames();
				for( String name : names )
				{
					Class<?> cls = spring2.getBean(name).getClass();
					Controller c = cls.getAnnotation(Controller.class);
					if( c != null ){
						Method[] mtds = cls.getMethods();
						for( Method m : mtds ){
							RequestMapping rm = m.
								getAnnotation(RequestMapping.class);
							if( rm != null ){
								methodMap.put(rm.value(),
									new MethodAndTarget(m,spring2.getBean(name)));
							}
						}
					}
				}
				spring = spring2;
			}
			catch( Exception e ){ i(e); }
		}
		return spring;
	}	
	
	public static String utf2kr( String l ){
		if( l == null || l.equals("") )
			return l;
		
		try{
			byte[] buf = l.getBytes("8859_1");
			l = new String( buf, "utf-8");
		}
		catch( Exception e ){}
		return l;
	}

	public static void i( Object obj )
	{
		Log log = LogFactory.getLog(main.Single.class);
		if( log.isInfoEnabled() )
		{
			if( obj == null )
				log.info("null");
			else
				log.info(obj.toString());
		}
	}
	
	public static void i( Throwable e ){
		/*	e.getCause() 예외의 원인이 되는 예외의 인스턴스에 대한 포인터
		 * 	더 이상의 원인이 없을때 까지 원인을 파 들어가는 코드이다.
		 */
		Throwable e2 = null;
		while( ( e2 = e.getCause() ) != null ){
			e = e2;
		}
		i( e.toString() );
	}
}
