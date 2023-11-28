package cin.ufpe.mop;

import java.io.Reader;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class CinUFPEReader_ManipulateAfterCloseMonitorAspect {
   
	Set<Object> objs = new HashSet();
	@Pointcut(value = "(call(* java.io.Reader+.close(..)) && target(reader))", argNames="reader")
	public void operationReaderManipulateAfterClose(Reader reader) {}
	
	@Before(value = "operationReaderManipulateAfterClose(reader)", argNames="reader")
	public void beforeReaderManipulateAfterClose(Reader reader) {
		objs.add(reader);
		System.out.println("saiu aqui...");
	}
	
	@Pointcut(value = "((call(* java.io.Reader+.read(..)) || "
			+ "(call(* java.io.Reader+.ready(..)) || "
			+ "(call(* java.io.Reader+.mark(..)) || "
			+ "(call(* java.io.Reader+.reset(..)) || "
			+ "call(* java.io.Reader+.skip(..)))))) && target(reader)) ",
			argNames = "reader")
	public void beforeManipulateAfterClose(Reader reader) {}
	
	@Before(value = "beforeManipulateAfterClose(reader)", argNames = "reader")
	public void vioManipulateAfterClose(Reader reader) {
		if(verifyObjets(objs , reader)) {
			System.out.println("violou codigo");
		}
	}
	private boolean verifyObjets(Set<Object> objs, Reader reader) {
		for (Object object : objs) {
			if(object.hashCode() == reader.hashCode()) {
				return true;
			}
		}
		return false;
	}
	
}
