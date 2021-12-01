package spring.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UniVo {//학교테이블
	
	private String schoolName; //학교이름
	private String schoolCubun; //학교구분
	private String schoolType; //학교유형
	private String region; //지역
	private String adres; //주소
	private String link; //사이트링크
	
	
	public String getSchoolName() {
		return schoolName;
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}


	public String getSchoolCubun() {
		return schoolCubun;
	}


	public void setSchoolCubun(String schoolCubun) {
		this.schoolCubun = schoolCubun;
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


	public String getAdres() {
		return adres;
	}


	public void setAdres(String adres) {
		this.adres = adres;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	@Override
	public String toString() {
		return "UniVo [schoolName=" + schoolName + ", schoolCubun=" + schoolCubun + ", schoolType=" + schoolType
				+ ", region=" + region + ", adres=" + adres + ", link=" + link + "]";
	}

	
}
