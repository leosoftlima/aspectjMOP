package cin.ufpe.mop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import cin.ufpe.mop.LoggerSpecification.SpecificationType;

import java.lang.reflect.Method;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;

@Aspect
public class CinUFPECollectionHashCodeMonitorAspect {
	
	
	@Pointcut(value = "(staticinitialization(java.util.Collection+))", argNames="")
	public void operationsCollectionHashCode() {}
	
	@After(value = "operationsCollectionHashCode()", argNames ="")
	public void afterCollectionHashCode(JoinPoint thisJoinPoint) {
		event_staticinit(thisJoinPoint.getStaticPart().getSignature());
	}
	

	 final boolean event_staticinit(Signature var1) {

	      Class declaratingType = var1.getDeclaringType();
	      if (declaratingType != null) {
	         Method methodEquals = null;
	         Method methodHashCode = null;

	         try {
	        	 methodEquals = declaratingType.getDeclaredMethod("equals", Object.class);
	        	 methodHashCode = declaratingType.getDeclaredMethod("hashCode", (Class[])null);
	         } catch (NoSuchMethodException e) {
	        	 e.printStackTrace();
	         }

	         if (methodEquals != null && methodHashCode == null) {
	        	 LoggerSpecification.printLogging(SpecificationType.CollectionHashCode, declaratingType.getName()); 
	         }
	      }

	      return true;
	   }
}
