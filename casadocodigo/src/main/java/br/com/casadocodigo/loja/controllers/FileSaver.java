package br.com.casadocodigo.loja.controllers;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Component
public class FileSaver {
	public String write(String baseFolder, MultipartFile multipartFile) {
		String homePath = System.getProperty("user.home");
		String baseFolderPath = homePath + File.separator + baseFolder;
		String filePath = baseFolderPath + File.separator + multipartFile.getOriginalFilename();
		try {
			multipartFile.transferTo(new File(filePath));
			return filePath;
		}catch (IOException e){
			throw new RuntimeException(e);
		}
	}
}
