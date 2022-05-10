package chap7;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class BufferdOutPutStreamExample {
	public static void main(String[] args) throws Exception{
		FileInputStream fis = null;
		FileOutputStream fos = null;
		BufferedInputStream bis = null;
		BufferdOutPutStreamExample bos = null;
		
		int data = -1;
		long start = 0;
		long end = 0;
		
		fis = new FileInputStream("C:\\Temp\\forest.jpg");
		bis = new BufferedInputStream(fis);
		fos = new FileOutputStream("C:\\Temp\\forest1.jpg");
		start  = System.currentTimeMillis();
		while((data = bis.read())!=-1) {
			fos.write(data);
		}
		fos.flush();
		end = System.currentTimeMillis();
		fos.close();
		bis.close();
		fis.close();
		System.out.println("사용하지 않았을 때 : "+ (end-start)+"ms");
		
		fis = new FileInputStream("C:\\Temp\\forest.jpg");
		bis = new BufferedInputStream(fis);
		fos = new FileOutputStream("C:\\Temp\\forest2.jpg");
		bos = new BufferdOutPutStreamExample(fos);
		start  = System.currentTimeMillis();
		while((data = bis.read())!=-1) {
			fos.write(data);
		}
		fos.flush();
		end = System.currentTimeMillis();
		fos.close();
		bis.close();
		fis.close();
		System.out.println("사용했을 때 : "+ (end-start)+"ms");
		
		
	}
}
