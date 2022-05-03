import java.io.IOException;
import java.io.OutputStream;

public class SystemOutExample {

	public static void main(String[] args) throws IOException {
		OutputStream os = System.out;
		
		for(byte b = 48; b<58; b++) {
			os.write(b);
		}
		os.write(13); //원래는 이클립스 13이 안되야 하는데 이클립스는 된다.
//		os.write(10); 
		
		for(byte b = 97; b<123; b++) {
			os.write(b);
		}
		
		os.write(13);
//		os.write(10);
		
		String hangul = "가나다라마바사아자차카타파하";
		byte[] hangulBytes = hangul.getBytes();
		os.write(hangulBytes);
		
		os.flush();
		
	}

}
