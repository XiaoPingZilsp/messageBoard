package com.lsp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.lsp.db.DBUtils;
import com.lsp.javabean.Writer;

public class WriterDaoImp implements WriterDao {
	private PreparedStatement pstm;
	private ResultSet rSet;

	//上传留言
	@Override
	public int addMessage(Writer writer) {
		// TODO Auto-generated method stub
		String name=writer.getName();
		String email=writer.getEmail();
		String theme=writer.getTheme();
		String content=writer.getMessage();
		String time=writer.getTime();
		String recall=writer.getRecall();

		String sql="insert into tb_writer(w_name,w_email,w_theme,w_message,w_time,answer) values(?,?,?,?,?,?)";
		
		try {
			pstm = DBUtils.getConnection().prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, email);
			pstm.setString(3, theme);
			pstm.setString(4, content);
			pstm.setString(5, time);
			pstm.setString(6, recall);
			pstm.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
            this.closeAll();
        }
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


    //查看留言
	@Override
	public List<Writer> findMessage() {
		// TODO Auto-generated method stub
		String sql = "select w_id,w_name,w_email,w_theme,w_message,w_time from tb_writer order by w_id DESC";
		List<Writer> list = new ArrayList<Writer>();											
		try {
			pstm = DBUtils.getConnection().prepareStatement(sql);
			rSet = pstm.executeQuery();
			while (rSet.next()) {
				Writer writer = new Writer();

				writer.setId(Integer.parseInt(rSet.getString(1)));
				writer.setName(rSet.getString(2));
				writer.setEmail(rSet.getString(3));
				writer.setTheme(rSet.getString(4));
				writer.setMessage(rSet.getString(5));
				writer.setTime(rSet.getString(6));
				
				list.add(writer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return list;
	}


	//查看特定留言内容
	@Override
	public List<Writer> showContent(int id) {
		// TODO Auto-generated method stub
		List<Writer> list = new ArrayList<Writer>();
		String sql = "select w_name,w_email,w_theme,w_message,w_time from tb_writer where w_id=?";
		
        try {
        	pstm = DBUtils.getConnection().prepareStatement(sql);
			pstm.setInt(1, id);
			rSet = pstm.executeQuery();
			while (rSet.next()) {
				Writer writer = new Writer();
				
				writer.setName(rSet.getString(1));
				writer.setEmail(rSet.getString(2));
				writer.setTheme(rSet.getString(3));
				writer.setMessage(rSet.getString(4));
				writer.setTime(rSet.getString(5));
				
				list.add(writer);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	//更新已回复
	@Override
	public void updateAnswer(int id) {
		// TODO Auto-generated method stub
		String temp="是";
		String sql = "update tb_writer set answer = ? where w_id = ?";
        try {
            pstm = DBUtils.getConnection().prepareStatement(sql);
            
            
            pstm.setString(1, temp);
            pstm.setInt(2, id);
            
            pstm.executeUpdate();
            
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            this.closeAll();
        }
	}
	
	//更新未回复或已删除
		@Override
		public void updateNoAnswer(int id) {
			// TODO Auto-generated method stub
			String temp="否";
			String sql = "update tb_writer set answer = ? where w_id = ?";
	        try {
	            pstm = DBUtils.getConnection().prepareStatement(sql);
	            pstm.setString(1, temp);
	            pstm.setInt(2, id);  
	            pstm.executeUpdate();
    
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally{
	            this.closeAll();
	        }
		}


		@Override
		public void delMessageById(int id) {
			// TODO Auto-generated method stub
			 String sql = "delete from tb_writer where w_id = ?";
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


		@Override
		public boolean checkDelMessage(int id) {
			// TODO Auto-generated method stub
			String sql = "select * from tb_writer where w_id = ?";
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
	

}
