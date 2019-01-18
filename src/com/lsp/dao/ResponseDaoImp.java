package com.lsp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lsp.db.DBUtils;
import com.lsp.javabean.Response;
import com.lsp.javabean.Writer;

public class ResponseDaoImp implements ResponseDao {
	private PreparedStatement pstm;
	private ResultSet rSet;
	//增加回复
	@Override
	public int answerMessage(Response responses) {
		// TODO Auto-generated method stub
		String name=responses.getName();
		String content=responses.getMessage();
		String time=responses.getTime();
		int id=responses.getW_id();
		
		String sql="insert into tb_response(re_name,re_message,re_time,w_id) values(?,?,?,?)";
		try {
			pstm = DBUtils.getConnection().prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, content);
			pstm.setString(3, time);
			pstm.setInt(4, id);
			pstm.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
            this.closeAll();
        }
		
		WriterDaoImp wdi=new WriterDaoImp();
		wdi.updateAnswer(id);
		return 0;
	}
	
	
	 //关闭流
    public void closeAll(){
        try {
            if (rSet!=null) {
                rSet.close();
                rSet = null;
            }
            if (pstm!=null) {
                pstm.close();
                pstm = null;
            }
            DBUtils.closeCon();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    
    //后台查看特定回复内容
	@Override
	public List<Response> showContent(int id) {
		// TODO Auto-generated method stub
		List<Response> list = new ArrayList<Response>();
		String sql = "select re_name,re_message,re_time from tb_response where re_id=?";
		
        try {
        	pstm = DBUtils.getConnection().prepareStatement(sql);
			pstm.setInt(1, id);
			rSet = pstm.executeQuery();
			while (rSet.next()) {
				Response response = new Response();
				response.setName(rSet.getString(1));
				response.setMessage(rSet.getString(2));
				response.setTime(rSet.getString(3));

				list.add(response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	//修改回复内容
	@Override
	public void updateAnswer(Response responses) {
		// TODO Auto-generated method stub
		 String sql = "update tb_response set re_message = ? where re_id = ?";
	        try {
	            pstm = DBUtils.getConnection().prepareStatement(sql);

	            pstm.setString(1, responses.getMessage());
	           
	            pstm.setInt(2, responses.getId());
	            
	            pstm.executeUpdate();
   
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally{
	            this.closeAll();
	        }
	}

	//删除回复
	@Override
	public void delMessageById(int id) {
		// TODO Auto-generated method stub
		 String sql = "delete from tb_response where re_id = ?";
	        try {
	            pstm = DBUtils.getConnection().prepareStatement(sql);
	            pstm.setInt(1, id);
	            pstm.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally{
	            this.closeAll();
	        }
	}

	//查询是否已删除回复
	@Override
	public boolean checkDelMessage(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from tb_response where re_id = ?";
		try {
			pstm = DBUtils.getConnection().prepareStatement(sql);
			pstm.setLong(1, id);
			
			rSet = pstm.executeQuery();
			if (rSet.next()) {
				return false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll();
		}

		return true;
	}

	  //前端查看特定回复内容
	@Override
	public List<Response> showFrontContent(int id) {
		// TODO Auto-generated method stub
		List<Response> list = new ArrayList<Response>();
		String sql = "select re_name,re_message,re_time from tb_response where w_id=?";
		
        try {
        	pstm = DBUtils.getConnection().prepareStatement(sql);
			pstm.setInt(1, id);
			rSet = pstm.executeQuery();
			while (rSet.next()) {
				Response response = new Response();
				response.setName(rSet.getString(1));
				response.setMessage(rSet.getString(2));
				response.setTime(rSet.getString(3));

				list.add(response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
