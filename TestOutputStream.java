package cin.ufpe.mop;

import java.io.FileOutputStream;
import java.io.IOException;

public class TestOutputStream {
	public static void main(String[] args) {
		try (FileOutputStream fos = new FileOutputStream("test.txt")) {
			fos.close();
			// Escreve alguns dados
			fos.write("Hello, AspectJ!".getBytes());
			//fos.flush();
			// Não fecha a saída com close
         // <-- Comente esta linha para testar o aspecto
			System.out.println("fimmm....");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

