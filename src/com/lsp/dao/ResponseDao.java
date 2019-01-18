package com.lsp.dao;

import java.util.List;

import com.lsp.javabean.Response;


public interface ResponseDao {
	//上传留言
    public int answerMessage(Response responses);
    //后台查看特定回复内容
    public  List<Response> showContent (int id);
  //前端查看特定回复内容
    public  List<Response> showFrontContent (int id);
  //修改回复
    public void updateAnswer(Response responses);
    //删除回复
    public void delMessageById(int id) ;
    //查询是否已删除回复
    public boolean checkDelMessage(int id);
    
}
