package com.atoz.screw.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @description: websocket信息推送
 * @author: hao.xu
 * @create: 2020-11-13 14:02
 */

@Component
@ServerEndpoint("/webSocket")
@Slf4j
public class WebSocket {
    private Session session;
    private static CopyOnWriteArraySet<WebSocket> webSockets=new CopyOnWriteArraySet<>();

    @OnOpen
    public void onopen(Session session){
        this.session=session;
        webSockets.add(this);
        log.info("有新的连接，数量：{}",webSockets.size());
    }

    @OnClose
    public void onclose(){
        webSockets.remove(this);
        log.info("关闭连接，数量：{}",webSockets.size());
    }

    @OnMessage
    public void onMessage(String message){
        log.info("收到客户端信息：{}",message);
    }

    public void sendMessage(String message) {
        for (WebSocket webSocket:webSockets){
            log.info("广播信息，message={}",message);
            try {
                webSocket.session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
