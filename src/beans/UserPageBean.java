package beans;

import java.util.ArrayList;
import java.util.List;

public class UserPageBean {
	public int getPageCount(int pageSize){//����һҳ�еļ�¼����������ҳ��
		MgtUserDAO m=new MgtUserDAO();
		int recordCount=0,t1=0,t2=0;
		recordCount=m.getCount();//��ȡ���û���
		t1=recordCount%pageSize;
		t2=recordCount/pageSize;
		return t1==0?t2:t2+1;//���������û�����ÿҳ��ʾ���û����õ���ҳ��
	}
	
	public List<User> getUsersByPage(int pageNum,int pageSize){//���ݵ�ǰҳ����ҳ���¼���õ�Ӧ����ʾ���û�
		MgtUserDAO m=new MgtUserDAO();
		List<User> userList=new ArrayList<User>();
		int startRecord=(pageNum-1)*pageSize;
		userList=m.getUserByST(startRecord, pageSize);
		return userList;
	}
}










