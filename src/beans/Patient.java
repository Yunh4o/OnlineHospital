package beans;

public class Patient {
	private int id;
	private String caseNum;
	private String pName;
	private String pSex;
	private String pAge;
	private String recipeNum;
	public Patient() {
		super();
	}
	
	public Patient(int id, String pName, String pSex, String pAge) {
		super();
		this.id = id;
		this.pName = pName;
		this.pSex = pSex;
		this.pAge = pAge;
	}

	public Patient(int id, String caseNum, String pName, String pSex, String pAge, String recipeNum) {
		super();
		this.id = id;
		this.caseNum = caseNum;
		this.pName = pName;
		this.pSex = pSex;
		this.pAge = pAge;
		this.recipeNum = recipeNum;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCaseNum() {
		return caseNum;
	}
	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpSex() {
		return pSex;
	}
	public void setpSex(String pSex) {
		this.pSex = pSex;
	}
	public String getpAge() {
		return pAge;
	}
	public void setpAge(String pAge) {
		this.pAge = pAge;
	}
	public String getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(String recipeNum) {
		this.recipeNum = recipeNum;
	}
	
}
