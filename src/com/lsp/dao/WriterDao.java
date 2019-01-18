package com.lsp.dao;

import java.util.List;


import com.lsp.javabean.Writer;

public interface WriterDao {
	//�ϴ�����
    public int addMessage(Writer writer);
  //�鿴��������
    public List<Writer>findMessage();
  //�鿴�ض���������
    public  List<Writer> showContent (int id);
    //�ѻظ�
    public void updateAnswer(int id);
    //δ�ظ�����ɾ���ظ�
    public void updateNoAnswer(int id);
    //ɾ������
    public void delMessageById(int id) ;
    //��ѯ�Ƿ���ɾ������
    public boolean checkDelMessage(int id);
}
