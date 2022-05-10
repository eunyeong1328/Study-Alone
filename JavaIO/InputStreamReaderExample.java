package chap7;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
//import java.io.*; //원래 이렇게 쓰였지만 위에가 요즘 추세
public class InputStreamReaderExample {
	public static void main(String[] args) throws Exception{
		InputStream is = System.in;
		Reader reader = new InputStreamReader(is);
		
		int readCharNo;
		char[] cbuf = new char[100];
		while((readCharNo = reader.read(cbuf))!=-1) {
			String data = new String(cbuf,0,readCharNo);
			System.out.println(data);
		}
		
		reader.close();
	}
}
