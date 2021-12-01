package spring.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DpmVo {//학과 &계열

	private String schoolName; //학교이름
	private String schoolGubun; //학교구분
	private String schoolType; //학교유형
	private String region; //지역
	private String ldpmt; //계열
	private String department; //학과
	
	
	public String getSchoolName() {
		return schoolName;
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}


	public String getSchoolGubun() {
		return schoolGubun;
	}


	public void setSchoolGubun(String schoolGubun) {
		this.schoolGubun = schoolGubun;
	}


	public String getSchoolType() {
		return schoolType;
	}


	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}


	public String getRegion() {
		return region;
	}


	public void setRegion(String region) {
		this.region = region;
	}


	public String getLdpmt() {
		return ldpmt;
	}


	public void setLdpmt(String ldpmt) {
		this.ldpmt = ldpmt;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	@Override
	public String toString() {
		return "DpmVo [schoolName=" + schoolName + ", schoolGubun=" + schoolGubun + ", schoolType=" + schoolType
				+ ", region=" + region + ", ldpmt=" + ldpmt + ", department=" + department + "]";
	}
	

	

	
	
}
