package chap7;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class OutputStreamWriterExample {
	public static void main(String[] args) throws Exception{
		
		File dir = new File("C:/Temp");
		if(dir.exists() == false) {dir.mkdir();}
		File file = new File("C:/Temp/file.txt");
		if(file.exists()) {file.createNewFile();}
		
		FileOutputStream fos = new FileOutputStream("C:/Temp/file.txt",true); //이어쓰기기능
		Writer writer = new OutputStreamWriter(fos);
		
		String data = "바이트 출력 스트림을 문자 출력 스트림으로 변환\n";
		writer.write(data);
		
		writer.flush();
		writer.close();
		System.out.println("파일 저장이 끝났습니다.");
		
	}

}
