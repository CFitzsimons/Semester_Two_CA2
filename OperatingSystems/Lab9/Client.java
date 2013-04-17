import java.io.*;
import java.net.*;

public class Client {

    // Receive some strings from a server on localhost
    public static void main(String[] args) throws IOException {

	// We need a socket to talk to another machine
	Socket clientSocket = null;

	// We use a BufferedReader to read from the socket
	BufferedReader socketIn = null;

        // We store socket input in a string
        String socketInput;

        try {

	    // Create socket and connect to the server on localhost (port 7777)
	    clientSocket = new Socket("localhost", 7777);

	    // Attach a reader to the socket's input stream
	    socketIn = new BufferedReader(
	        new InputStreamReader(clientSocket.getInputStream()));

        } catch (UnknownHostException e) {

	    // Simply exit if server is unreachable
	    System.err.println("Don't know about host: localhost");
            System.exit(1);

        }

        // While there is something to read from the socket
        while ((socketInput = socketIn.readLine()) != null) {

	    // Print what we get back
	    System.out.println("Received: " + socketInput);

        }

        // Close
        socketIn.close();
        clientSocket.close();
    }
}