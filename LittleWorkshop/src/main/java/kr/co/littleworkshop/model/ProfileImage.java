package kr.co.littleworkshop.model;

import kr.co.littleworkshop.util.UploadFile;

public class ProfileImage implements UploadFile{
	
	int profileImageCode;
	String id;
	String profileImageUuid;
	String profileImageName;
	
	public int getProfileImageCode() {
		return profileImageCode;
	}
	public void setProfileImageCode(int profileImageCode) {
		this.profileImageCode = profileImageCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProfileImageUuid() {
		return profileImageUuid;
	}
	public void setProfileImageUuid(String profileImageUuid) {
		this.profileImageUuid = profileImageUuid;
	}
	public String getProfileImageName() {
		return profileImageName;
	}
	public void setProfileImageName(String profileImageName) {
		this.profileImageName = profileImageName;
	}
	
	
	@Override
	public void setFileNm(String filename) {
		this.profileImageName = filename;
	}
	@Override
	public void setFileUuid(String uuid) {
		this.profileImageUuid = uuid;
	}
	@Override
	public String getFileNm() {
		return profileImageName;
	}
	@Override
	public String getFileUuid() {
		return profileImageUuid;
	}
	

}
