package cin.ufpe.mop;

import java.io.IOException;
import java.io.StringReader;

public class ManipulateRedearManupulateClose {

	public static void main(String[] args) throws IOException {
		StringReader reader = new StringReader("hello");
		int i = reader.read();
		reader.close();

		// After a reader is closed, most operations, such as read() and reset(), are banned.
		//int j = reader.read();
		
		System.out.println("terminou");

	}

}
