package cin.ufpe.mop;

import java.util.ArrayList;
import java.util.List;

public class TestCollectionHashCode{

	public static void main(String[] args) {
		
		 MyList myList = new MyList();
		 
//		// TODO Auto-generated method stub
//		// A inicialização estática de java.util.Collection será capturada pelo aspecto.
//		List<String> list = new ArrayList<>();
//		list.add("Teste");
//
//		// Verifica se o método hashCode() está presente
//		if (list instanceof java.util.Collection) {
//			int hashCode = ((java.util.Collection<?>) list).hashCode();
//			System.out.println("HashCode da lista: " + hashCode);
//		}

		System.out.println("Main class executed successfully.");
	}
	
	static class MyList extends java.util.ArrayList<String> {
        // Classe de exemplo que é uma subclasse de java.util.Collection
		
		@Override
		public int hashCode() {
			return super.hashCode();
		}
		@Override
		public boolean equals(Object obj) {
			return true;
		}
    }
}


