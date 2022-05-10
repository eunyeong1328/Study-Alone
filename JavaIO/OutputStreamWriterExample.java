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
		
		FileOutputStream fos = new FileOutputStream("C:/Temp/file.txt",true); //�̾����
		Writer writer = new OutputStreamWriter(fos);
		
		String data = "����Ʈ ��� ��Ʈ���� ���� ��� ��Ʈ������ ��ȯ\n";
		writer.write(data);
		
		writer.flush();
		writer.close();
		System.out.println("���� ������ �������ϴ�.");
		
	}

}
