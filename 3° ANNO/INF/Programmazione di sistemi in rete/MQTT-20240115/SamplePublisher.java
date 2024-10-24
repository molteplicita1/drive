package it.unisannio.Ex12;

import org.eclipse.paho.client.mqttv3.MqttClient;


public class SamplePublisher {
		private MqttClient publisher;
		
		public SamplePublisher(String ba) throws Exception {
			publisher = new MqttClient(ba, "pub");
			publisher.connect();
		}
		
		public void publish() throws Exception {
			while (true) {
				 try { Thread.sleep(1000); } catch (InterruptedException e) { }
			     publisher.publish("/nodes/10/sensors/10/samples", new String("{ \"attribute\" : \"temperature\", \"simpleValue\" : \" " + (Math.random()*2+20) + "\"  }").getBytes(), 1, false);
			}   
		}
		public static void main(String[] args) throws Exception {
			String brokerAddress = "tcp://127.0.0.1:1883";
			SamplePublisher spub = new SamplePublisher(brokerAddress);
			spub.publish();  
		}
}



