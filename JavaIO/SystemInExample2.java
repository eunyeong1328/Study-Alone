import java.io.IOException;
import java.io.InputStream;

public class SystemInExample2 {

	public static void main(String[] args) throws Exception {
		InputStream is = System.in;
		
		byte[] datas = new byte[100];
		
		System.out.println("�̸�: ");
		int nameBytes = is.read(datas);
		String name = new String(datas, 0, nameBytes-2);
		
		System.out.println("�ϰ� ������: ");
		int commnetBytes = is.read(datas);
		String commnet = new String(datas, 0, nameBytes-2);
		
		System.out.println("�Է��� �̸�: " + name);
		System.out.println("�Է��� �ϰ� ������: " + commnet);
		
	} 

}
