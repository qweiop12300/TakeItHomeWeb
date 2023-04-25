package com.ruoyi.app.service;


import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.app.domain.AppMessage;
import com.ruoyi.app.mapper.AppMessageMapper;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.framework.web.service.TokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
@ServerEndpoint("/webSocket/{token}")
public class WebSocketService {

    private final Logger logger = LoggerFactory.getLogger(WebSocketService.class);


    private static TokenService tokenService = TokenService.getBean(TokenService.class);
    /**
     * 保存连接信息
     */
    static final Map<Long, Session> CLIENTS = new ConcurrentHashMap<>();

    private Long userId;

    @Autowired
    private AppMessageMapper messageMapping;

    @OnOpen
    public void onOpen(@PathParam("token") String token, Session session) throws Exception {


        LoginUser loginUser = tokenService.getLoginUser(token);

        if (loginUser!=null){
            userId = loginUser.getUserId();

            if (CLIENTS.containsKey(userId)){
                onClose(CLIENTS.remove(userId));
            }

            CLIENTS.put(userId, session);

            sendMessage(JSON.toJSONString(new AjaxResult(200,"连接成功")),session);
            return;
        }

        sendMessage(JSON.toJSONString(new AjaxResult(101,"连接失败,请登录")),session);

    }

    @OnClose
    public void onClose(@PathParam("token") String terminalId, Session session) throws Exception {
        sendMessage(JSON.toJSONString(new AjaxResult(400,"断开连接")),session);
        if (userId!=null){
            onClose(session);
            CLIENTS.remove(userId);
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        if (userId!=null){
            AppMessage appMessage = JSONObject.parseObject(message,AppMessage.class);
            appMessage.setUid(userId);
            appMessage.setTypeId(4L);
            appMessage.setCreateDate(new Date());
            messageMapping.insertNewAppMessage(appMessage);
        }
    }

    @OnError
    public void onError(Session session, Throwable error) {
        logger.error(error.toString());
    }

    public void onClose(Session session) {
        try {
            session.close();
        } catch (IOException e) {
            logger.error("关闭连接异常：" + e);
        }
    }

    public void sendMessage(String message, Session session) {
        try {
            session.getAsyncRemote().sendText(message);
        } catch (Exception e) {
            logger.error("推送异常：" + e);
        }
    }

}
