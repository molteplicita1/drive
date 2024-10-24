
package it.unisannio.websocket.chat;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;


@ServerEndpoint(value = "/websocket/chat")
public class ChatServer {
	
    private static final String GUEST_PREFIX = "Guest";
    private static int connectionIds;
    private static Set<ChatServer> connections = new CopyOnWriteArraySet<>();

    private final String nickname;
    private Session session;

    public ChatServer() {
        nickname = GUEST_PREFIX + "-" + connectionIds++;
    }

    @OnOpen
    public void start(Session session) {
        this.session = session;
        connections.add(this);
        String message = "* " +nickname + " is now connected to the chat.";
        broadcast(message);
    }

   
    @OnClose
    public void end() {
        connections.remove(this);
        String message = "* "+ nickname + " disconnected";
        broadcast(message);
    }


    @OnMessage
    public void receive(String message) {
        String myMsg = "-> " +nickname + ": "+ message;
        broadcast(myMsg);
    }

    @OnError
    public void onError(Throwable t) throws Throwable {
        
    }


    private void broadcast(String msg) {
        for (ChatServer client : connections) {
            try {
                synchronized (client) {
                    client.session.getBasicRemote().sendText(msg);
                }
            } catch (IOException e) {
                
                connections.remove(client);
                try {
                    client.session.close();
                } catch (IOException e1) {
                    // Ignore
                }
                String message = "* "+ client.nickname + " disconnected.";
                broadcast(message);
            }
        }
    }
}