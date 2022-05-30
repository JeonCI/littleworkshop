package kr.co.littleworkshop.util;

import java.io.File;
import java.util.List;

public class DeleteFile<T extends UploadFile> {
	final String filePath = "c:/upload/";

	public Boolean deleteImage(String root) {
	
		File f = new File(filePath + root);
		if (f.exists())
			f.delete();
		
		return true;
	}

}
