package cin.ufpe.mop;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class TestClass {

	public static void main(String[] args) {
		 try {
	            // String a ser codificada
	            String originalString = "Olá, mundo!";

	            // Codificando a string usando URLEncoder
	            String encodedString = URLEncoder.encode(originalString, "ISO-8859-1");

	            // Exibindo resultados
	            System.out.println("String Original: " + originalString);
	            System.out.println("String Codificada: " + encodedString);
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }
	    }
      
      
	}


