package cin.ufpe.util;

import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
import com.runtimeverification.rvmonitor.java.rt.ViolationRecorder;
import com.runtimeverification.rvmonitor.java.rt.RVMLogging.Level;

public class LoggerSpecification  {
	
	public enum SpecificationType{
		URLEncoder_encoderUTF8,
		Long_BadParsingArgs,
		Long_BadParsingRadix,
		CollectionHashCode
	}
	
	public static void printLogging(SpecificationType specificationType) {
        
		printBaseInformation(specificationType);
		
		switch(specificationType){	
		case Long_BadParsingArgs:	
			RVMLogging.out.println(Level.CRITICAL, "Wrong argument to Long.parseLong(String s)");
			break;
		case Long_BadParsingRadix:
			RVMLogging.out.println(Level.CRITICAL, "Wrong argument to Long.parseLong(String s, int radix)");
			break;
		default:

		}
	}
	public static void printLogging(SpecificationType specificationType, String information) {
		switch(specificationType){	
		case CollectionHashCode:
			RVMLogging.out.println(Level.CRITICAL, information + " overrides equals() but does not override hashCode().");
			break;
		default:

		}
	}
	
	private static void printBaseInformation(SpecificationType specificationType) {
		String lineOfCode = ViolationRecorder.getLineOfCode();
		String flagCinUFPE = "[cin.ufpe.mop.aspectJ]";
		String message = flagCinUFPE + " Specification " + specificationType + " has been violated on line " + lineOfCode;
		
		RVMLogging.out.println(Level.CRITICAL, message);
	}
}
