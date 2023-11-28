package cin.ufpe.mop;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.*;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import cin.ufpe.mop.LoggerSpecification.SpecificationType;

@Aspect
public class CinUfpeURLEncoder_EncodeUTF8MonitorAspect2 {
		
	@Pointcut(
			value ="(call(* java.net.URLEncoder.encode(java.lang.String, java.lang.String)) && args(*, enc))", argNames = "enc"	)
	public void URLEncoder_EncodeUTF8_encode(String enc) {}
	
	@Before(value = "URLEncoder_EncodeUTF8_encode(enc)", argNames = "enc")
	public void beforeURLEncoder_EncodeUTF8(String enc) {
//		this.actionURLEncoder_EncodeUTF8_encodeEvent(enc);
		violationEncoderUTF8(enc);
	}
	
	private void actionURLEncoder_EncodeUTF8_encodeEvent(final String enc) {
		while(!URLEncoder_EncodeUTF8_Lock.tryLock()) {
			Thread.yield();
		}
		if(objectURLEncode == null) {
			objectURLEncodeStart();
		}
		objectURLEncode.violationEncoderUTF8(enc);
		URLEncoder_EncodeUTF8_Lock.unlock();
		
	}
	private boolean violationEncoderUTF8(String str) {
	     if (!str.equalsIgnoreCase("utf-8") && !str.equalsIgnoreCase("utf8")) {
	    	 LoggerSpecification.printLogging(SpecificationType.URLEncoder_encoderUTF8); 
	      } 
	     return true;
	}
	private static void objectURLEncodeStart() {
		objectURLEncode = new CinUfpeURLEncoder_EncodeUTF8MonitorAspect2();
	}
	 
		static ReentrantLock URLEncoder_EncodeUTF8_Lock;
		static Condition URLEncoder_EncodeUTF8_Lock_cond;
		public static CinUfpeURLEncoder_EncodeUTF8MonitorAspect2 objectURLEncode;
		
		static {
		      try {
		    	  URLEncoder_EncodeUTF8_Lock = new ReentrantLock();
		          URLEncoder_EncodeUTF8_Lock_cond = URLEncoder_EncodeUTF8_Lock.newCondition(); 
		      }catch (Exception e) {
				// TODO: handle exception
		    	  
			}
		 }
}
