package beans;

import java.util.ArrayList;
import java.util.List;

public class UserPageBean {
	public int getPageCount(int pageSize){//根据一页中的记录数，计算总页数
		MgtUserDAO m=new MgtUserDAO();
		int recordCount=0,t1=0,t2=0;
		recordCount=m.getCount();//获取总用户数
		t1=recordCount%pageSize;
		t2=recordCount/pageSize;
		return t1==0?t2:t2+1;//返回由总用户数和每页显示的用户数得到总页数
	}
	
	public List<User> getUsersByPage(int pageNum,int pageSize){//根据当前页数和页面记录数得到应该显示的用户
		MgtUserDAO m=new MgtUserDAO();
		List<User> userList=new ArrayList<User>();
		int startRecord=(pageNum-1)*pageSize;
		userList=m.getUserByST(startRecord, pageSize);
		return userList;
	}
}










