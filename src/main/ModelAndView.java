package main;

import java.util.Hashtable;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class ModelAndView {
	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	private String viewName = null;
	private Map<String,Object> objMap = null;
	
	public ModelAndView() {
 
	}
	
	public ModelAndView( String vn ) {
		viewName = vn;
	}	
	
	public void addObject( String key, Object val ){
		if( objMap == null ){
			objMap = new Hashtable<String,Object>();
		}
		if( key != null && val != null ){
			objMap.put(key, val);
		}
	}
	
	/*	addObject 를 이용하여 objMap 에 저장된 내역은
	 * 	fill 을 호출하게되면 request 에 옮겨지게 된다.
	 */
	public void fill( HttpServletRequest request ){
		if( objMap != null && objMap.size() > 0 )
		{
			Set<String> ks = objMap.keySet();
			for( String key : ks ){
				Object val = objMap.get(key);
				request.setAttribute(key,val);
			}
		}
	}
}






