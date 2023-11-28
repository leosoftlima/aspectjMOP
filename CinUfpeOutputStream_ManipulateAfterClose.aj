package cin.ufpe.mop;

import java.io.OutputStream;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.SourceLocation;

import com.runtimeverification.rvmonitor.java.rt.RVMLogging;
import com.runtimeverification.rvmonitor.java.rt.ViolationRecorder;


@Aspect
public class CinUfpeOutputStream_ManipulateAfterClose {
    private AtomicInteger pairValue;
    static final int[] Prop_1_transition_close;
    
    Set<Object> objs;
    Set<SourceLocation> locs;
    
    public CinUfpeOutputStream_ManipulateAfterClose() {
		// TODO Auto-generated constructor stub
    	 this.pairValue = new AtomicInteger(this.calcularValorDePar(-1, 0));
	}

	@Pointcut(value = "(call(* java.io.OutputStream+.close(..)) && (target(outputStream) && !target(ByteArrayOutputStream)))", argNames ="outputStream")
	public void OutputStream_OperationClose(OutputStream outputStream) {
	}
	
	@Before( value = "OutputStream_OperationClose(outputStream)", argNames = "outputStream")
	public void OutputStream_Operations(OutputStream outputStream, final JoinPoint.StaticPart thisJoinPointStaticPart) {
//		if() {
//			
//		}
		if(Prop_1_event_close()) {
			Prop_1_handler_match();
		}
		
	}
    private final int getEstado(final int n) {
    	return  n % 4;
    }
	private final int calcularValorDePar(final int a , final int b) {
		int resposta = ((a + 1) * 4) | b;
		return resposta;
	}
	
	private final int handleEvent(final int a, final int[] array) {
        int value;
        int b;
        do {
            value = this.pairValue.get();
            b = array[this.getEstado(value)];
        } while (!this.pairValue.compareAndSet(value, this.calcularValorDePar(a, b)));
        return b;
    }
	
    static {
        Prop_1_transition_close = new int[] { 1, 1, 3, 3 };
    }
    
    final boolean Prop_1_event_close() {
    	return (this.handleEvent(1, Prop_1_transition_close) == 2);
    }
    
    final void Prop_1_handler_match() {
        RVMLogging.out.println(RVMLogging.Level.CRITICAL, "Specification OutputStream_ManipulateAfterClose has been violated on line " + ViolationRecorder.getLineOfCode() + ". Documentation for this property can be found at http://runtimeverification.com/monitor/annotated-java/__properties/html/mop/OutputStream_ManipulateAfterClose.html");
        RVMLogging.out.println(RVMLogging.Level.CRITICAL, "write() or flush() was invoked after close().");
    }
}
