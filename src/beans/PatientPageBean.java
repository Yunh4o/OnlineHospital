package beans;

import java.util.ArrayList;
import java.util.List;

public class PatientPageBean {
	public int getPageCount(int pageSize){//根据一页中的记录数，计算总页数
		MgtPatientDAO m=new MgtPatientDAO();
		int recordCount=0,t1=0,t2=0;
		recordCount=m.getCount();//获取总病人数
		t1=recordCount%pageSize;
		t2=recordCount/pageSize;
		return t1==0?t2:t2+1;//返回由总病人数和每页显示的用户数得到总页数
	}
	
	public List<Patient> getPatientsByPage(int pageNum,int pageSize){//根据当前页数和页面记录数得到应该显示的病人
		MgtPatientDAO m=new MgtPatientDAO();
		List<Patient> patientList=new ArrayList<Patient>();
		int startRecord=(pageNum-1)*pageSize;
		patientList=m.getPatientByST(startRecord, pageSize);
		return patientList;
	}
}
