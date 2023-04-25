package com.ruoyi.app.service;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.app.domain.AppMessage;
import com.ruoyi.app.mapper.AppMessageMapper;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.websocket.Session;
import java.util.List;
import java.util.Map;

@Component("messageTask")
public class MessageService {

    @Autowired
    private AppMessageMapper messageMapper;

    public void forMessage() {
        System.out.println("----");


        Map<Long, Session> CLIENTS = WebSocketService.CLIENTS;


        List<AppMessage> messages = messageMapper.selectNewAppMessageList(new AppMessage());
        if (messages.size()>0){
            for(AppMessage appMessage:messages){
                if (CLIENTS.containsKey(appMessage.getToUid())){
                    sendMessage(appMessage,CLIENTS.get(appMessage.getToUid()));
                    appMessage.setIsShow(1);
                }
                messageMapper.deleteAppMessageById(appMessage.getId());
                messageMapper.insertAppMessage(appMessage);
            }
        }
    }

    public void sendMessage(AppMessage appMessage, Session session) {
        try {
            session.getAsyncRemote().sendText(JSON.toJSONString(new AjaxResult(201,"新消息",appMessage)));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
