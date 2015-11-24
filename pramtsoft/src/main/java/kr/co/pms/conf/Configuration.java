package kr.co.pms.conf;

public class Configuration {
	public enum Files {
		Gangjwa("GangjwaDB.txt"),
		Gwamok("GwamokDB.txt"),
		User("UserDB.txt");
		
		private String fileName;
		
		Files(String fileName){
			this.fileName = fileName;
		}

		public String getFileName() {
			return fileName;
		}
		
	}
	public enum ErrorCodes {
		ER0000("ER0000", "Can't connect to DB. Please contact to System Administrator.", "데이터배이스 연결에 실패 하였습니다. 시스템 관리자에게 문의해 주세요."),
		ER0001("ER0001", "Error ocurred when querying. Please contact to System Administrator ", "쿼리수행에서 오류가 발생하였습니다. 시스템 관리자에게 문의해 주세요."),
		ER1001("ER1001", "You're input invalid ID. Check ID and retry.", "없는 아이디 입니다. 확인 후 다시 로그인 해 주세요."),
		ER1002("ER1002", "You're input invalid Password. Check ID and Password.", "비밀번호가 틀렸습니다. 확인 후 다시 로그인 해 주세요."),
		ER2000("ER2000", "Error ocurred when querying Project Table. Please contact to System Administrator", "프로젝트 테이블 쿼리수행에서 오류가 발생하였습니다. 시스템 관리자에게 문의해 주세요."),
		ER2001("ER2001", "Duplicate Subject Data! Please Check Input Values!", "과목 정보가 중복됩니다. 입력값을 다시 확인해 주세요."),
		ER3000("ER3000", "Error ocurred when querying Approval Table. Please contact to System Administrator", "결재 테이블 쿼리수행에서 오류가 발생하였습니다. 시스템 관리자에게 문의해 주세요."),
		ER8000("ER8000", "Error on your SQL. Check SQL Sentence again.", "입력된 SQL문에 오류가 있습니다. 다시 확인해 보세요."),
		Success("Success", "Your request is performed clearly.", "요청이 정상적으로 처리 되었습니다.");
		
		private String codeName;
		private String subtitleEng;
		private String subtitleKor;
		
		ErrorCodes(String codeName, String subtitleEng, String subtitleKor){
			this.codeName = codeName;
			this.subtitleEng = subtitleEng;
			this.subtitleKor = subtitleKor;
		}
		public String getCodeName() {
			return codeName;
		}

		public String getSubtitleEng() {
			return subtitleEng;
		}

		public String getSubtitleKor() {
			return subtitleKor;
		}		
		
	}
	
	public enum UserData {
		UIDX("UIDX", "학번"),
		USERID("USERID", "아이디"),
		USERPASSWORD("USERPASSWORD", "비밀번호"),
		USERNAME("USERNAME", "이름"),
		USERTYPE("USERTYPE", "학적"),
		DEPT("DEPT", "학과"),
		COLLEGE("COLLEGE", "단과대");
		
		
		private String name;
		private String detail;
		UserData(String name, String detail){
			this.name=name;
			this.detail=detail;
		}
		public String getName() {
			return name;
		}
		public String getDetail(){
			return detail;
		}
	}

}
