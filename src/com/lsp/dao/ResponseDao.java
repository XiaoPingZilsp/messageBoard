package com.lsp.dao;

import java.util.List;

import com.lsp.javabean.Response;


public interface ResponseDao {
	//�ϴ�����
    public int answerMessage(Response responses);
    //��̨�鿴�ض��ظ�����
    public  List<Response> showContent (int id);
  //ǰ�˲鿴�ض��ظ�����
    public  List<Response> showFrontContent (int id);
  //�޸Ļظ�
    public void updateAnswer(Response responses);
    //ɾ���ظ�
    public void delMessageById(int id) ;
    //��ѯ�Ƿ���ɾ���ظ�
    public boolean checkDelMessage(int id);
    
}
