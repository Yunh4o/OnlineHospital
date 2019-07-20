package beans;

public class Recipe {
	private String recipeNum;
	private String caseReason;
	private String recipeInfo;
	private String delDoc;
	public Recipe() {
		super();
	}
	public Recipe(String recipeNum, String caseReason, String recipeInfo, String delDoc) {
		super();
		this.recipeNum = recipeNum;
		this.caseReason = caseReason;
		this.recipeInfo = recipeInfo;
		this.delDoc = delDoc;
	}
	public String getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(String recipeNum) {
		this.recipeNum = recipeNum;
	}
	public String getCaseReason() {
		return caseReason;
	}
	public void setCaseReason(String caseReason) {
		this.caseReason = caseReason;
	}
	public String getRecipeInfo() {
		return recipeInfo;
	}
	public void setRecipeInfo(String recipeInfo) {
		this.recipeInfo = recipeInfo;
	}
	public String getDelDoc() {
		return delDoc;
	}
	public void setDelDoc(String delDoc) {
		this.delDoc = delDoc;
	}
	
}
