package beans;

import java.util.ArrayList;
import java.util.List;

public class PatientPageBean {
	public int getPageCount(int pageSize){//����һҳ�еļ�¼����������ҳ��
		MgtPatientDAO m=new MgtPatientDAO();
		int recordCount=0,t1=0,t2=0;
		recordCount=m.getCount();//��ȡ�ܲ�����
		t1=recordCount%pageSize;
		t2=recordCount/pageSize;
		return t1==0?t2:t2+1;//�������ܲ�������ÿҳ��ʾ���û����õ���ҳ��
	}
	
	public List<Patient> getPatientsByPage(int pageNum,int pageSize){//���ݵ�ǰҳ����ҳ���¼���õ�Ӧ����ʾ�Ĳ���
		MgtPatientDAO m=new MgtPatientDAO();
		List<Patient> patientList=new ArrayList<Patient>();
		int startRecord=(pageNum-1)*pageSize;
		patientList=m.getPatientByST(startRecord, pageSize);
		return patientList;
	}
}
