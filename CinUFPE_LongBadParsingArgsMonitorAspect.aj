package cin.ufpe.mop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import cin.ufpe.mop.LoggerSpecification.SpecificationType;

@Aspect
public class CinUFPE_LongBadParsingArgsMonitorAspect {


	@Pointcut(value = "(call(* java.lang.Long.parseLong(java.lang.String)) && args(string))", argNames = "string")
	public void operationsLongBadParsingArg(String string) {}

	@Before(value = "operationsLongBadParsingArg(string)", argNames = "string")
	public void beforeLongBadParsingArgs(String string) {
		violationLongBadParsing(string);
	}

	private final void violationLongBadParsing(String string) {
		if (string != null && string.length() != 0) {
			for(int str = 0; str < string.length(); ++str) {
				if (verifyDigit(str, string)) {
                   LoggerSpecification.printLogging(SpecificationType.Long_BadParsingArgs); 
				   break;
				}
			}
		} else {
			LoggerSpecification.printLogging(SpecificationType.Long_BadParsingArgs); 
		}
	}
	
	private final boolean verifyDigit(int str, String string) {
		return (Character.digit(string.charAt(str), 10) == -1 && 
				(str != 0 || string.length() <= 1 || string.charAt(0) != '-') && 
				(str != string.length() - 1 || string.charAt(str) != 'l' && string.charAt(str) != 'L'));
	}
	
	
	@Pointcut(value = "(call(* java.lang.Long.parseLong(java.lang.String, int)) && args(string, radix))", argNames = "string, radix")
	public void operationsLongBadParsingRadix(String string, int radix) {}
	
	@Before(value ="operationsLongBadParsingRadix(string, radix)", argNames = "string, radix")
	public void beforeLongBadParsingArgsWithRadix(String string, int radix) {
		violationLongBadParsingRadix(string, radix);
	}
	
	private final void violationLongBadParsingRadix(String string, int radix) {
		 if (string != null && string.length() != 0) {
	         if (radix >= 2 && radix <= 36) {
	            for(int number = 0; number < string.length(); ++number) {
	               if (verifyDigitRadix(string, radix, number)) {
	            	   LoggerSpecification.printLogging(SpecificationType.Long_BadParsingRadix);
	            	   break;
	               }
	            }
	         } else {
	        	 LoggerSpecification.printLogging(SpecificationType.Long_BadParsingRadix); 
	         }
	      } else {
	    	  LoggerSpecification.printLogging(SpecificationType.Long_BadParsingRadix); 
	      }
	}
	private final boolean verifyDigitRadix(String string,int radix ,int number) {
		return (Character.digit(string.charAt(number), radix) == -1 && 
				(number != 0 || string.length() <= 1 || string.charAt(0) != '-') && 
				(number != string.length() - 1 || string.charAt(number) != 'l' && 
				 string.charAt(number) != 'L'));
	}
}
