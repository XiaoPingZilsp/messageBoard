package com.lsp.dao;

import java.util.List;


import com.lsp.javabean.Writer;

public interface WriterDao {
	//上传留言
    public int addMessage(Writer writer);
  //查看所有留言
    public List<Writer>findMessage();
  //查看特定留言内容
    public  List<Writer> showContent (int id);
    //已回复
    public void updateAnswer(int id);
    //未回复或已删除回复
    public void updateNoAnswer(int id);
    //删除留言
    public void delMessageById(int id) ;
    //查询是否已删除留言
    public boolean checkDelMessage(int id);
}
