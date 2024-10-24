package it.unisannio.Ex12;

import org.eclipse.paho.client.mqttv3.IMqttMessageListener;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;


public class SampleSubscriber  {
	private  MqttClient subscriber;

	public SampleSubscriber(String ba) throws Exception {
		subscriber = new MqttClient(ba, "sub1");
		subscriber.connect();
	}
	public void subscribe() throws Exception {
		subscriber.subscribe("/nodes/+/sensors/+/samples", new MyListener());
	}
	public static void main(String[] args) throws Exception {
		SampleSubscriber ssub = new SampleSubscriber("tcp://127.0.0.1:1883");
		ssub.subscribe();
	}
}

class MyListener implements IMqttMessageListener {
	public void messageArrived(String topic, MqttMessage msg) {
		System.out.println("A message is arrived");
		try {
			System.out.println(new String(msg.getPayload()));
		} catch(Exception e) {System.err.println(e);}   
	}
}