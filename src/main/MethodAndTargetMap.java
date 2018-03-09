package main;

import java.util.Hashtable;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;

public class MethodAndTargetMap implements InitializingBean
{
	public Map<String, MethodAndTarget> getMapping() {
		return mapping;
	}

	private Map<String,MethodAndTarget> mapping = null;

	@Override
	public void afterPropertiesSet() throws Exception {
		mapping = new Hashtable<String, MethodAndTarget>();
	}
}
