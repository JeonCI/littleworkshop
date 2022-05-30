package kr.co.littleworkshop.util;

import java.io.File;
import java.util.List;

public class DeleteFile<T extends UploadFile> {
	final String filePath = "c:/upload/";

	public Boolean deleteImage(String root) {
		File f = new File(filePath + root);
		try {
			while (f.exists()) {
				File[] f_list = f.listFiles(); // 파일리스트 얻어오기

				for (int i = 0; i < f_list.length; i++) {
					f_list[i].delete(); // 파일 삭제
				}
				f.delete();

			}
		} catch (Exception e) {
			e.getStackTrace();
		}

		return true;
	}
}
