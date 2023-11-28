package cin.ufpe.mop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import cin.ufpe.mop.LoggerSpecification.SpecificationType;

@Aspect
public class CinUfpeURLEncoder_EncodeUTF8MonitorAspect {
		
	@Pointcut(
			value ="(call(* java.net.URLEncoder.encode(java.lang.String, java.lang.String)) && args(*, enc))", argNames = "enc"	)
	public void URLEncoder_EncodeUTF8_encode(String enc) {}
	
	@Before(value = "URLEncoder_EncodeUTF8_encode(enc)", argNames = "enc")
	public void beforeURLEncoder_EncodeUTF8(String enc) {
		violationEncoderUTF8(enc);
	}
	

	private boolean violationEncoderUTF8(String str) {
	     if (!str.equalsIgnoreCase("utf-8") && !str.equalsIgnoreCase("utf8")) {
	    	 LoggerSpecification.printLogging(SpecificationType.URLEncoder_encoderUTF8); 
	      } 
	     return true;
	}
	
}
