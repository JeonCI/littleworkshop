package kr.co.littleworkshop.util;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class Uploader<T extends UploadFile> {

	 final String uploadPath = "C:/upload/";
	
	public List<T> makeProductImageList(List<MultipartFile> files, Class<T> type, String folder) throws Exception {
		List<T> result = new ArrayList<>();

		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString() + filename;
				String root = uploadPath + folder + "/" + uuid;
				
				Path directoryPath = Paths.get(root);
				Files.createDirectories(directoryPath);
				file.transferTo(new File(root));

				T item = type.getDeclaredConstructor().newInstance();
				item.setFileNm(filename);
				item.setFileUuid(uuid);

				result.add(item);
			}
		}

		return result;
	}
	
	public T makeProfileImage(MultipartFile file, Class<T> type, String folder) throws Exception {
		
		T result = null;
			if (!file.isEmpty()) {
				
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString() + filename;
				String root = uploadPath + folder + "/" + uuid;
				
				Path directoryPath = Paths.get(root);
				Files.createDirectories(directoryPath);
				file.transferTo(new File(root));
				
				T item = type.getDeclaredConstructor().newInstance();
				item.setFileNm(filename);
				item.setFileUuid(uuid);

				
				result = item;
			}
		
		return result;
	}
}