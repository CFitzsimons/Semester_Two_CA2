import java.net.*;
import java.io.*;

// One thread per connection, this is it
class ServerThread extends Thread {

    // The socket passed from the creator
    private Socket socket = null;

    public ServerThread(Socket socket) {

    	this.socket = socket;

    }

    // Handle the connection
    public void run() {

    	try {

	    // Attach a printer to the socket's output stream
	    PrintWriter socketOut = new PrintWriter(socket.getOutputStream(),
	        true);

	    // Send a message to the client
	    socketOut.println("FUCK YOU, NOBODY LIKES YOU AND YOU'LL DIE ALONE.");

	    // Close things
	    socketOut.close();
	    socket.close();

	} catch (IOException e) {

	    e.printStackTrace();

    	}
    }
}

// The server
public class Server {

    public static void main(String[] args) throws IOException {

	// The server socket, connections arrive here
        ServerSocket serverSocket = null;

        try {

	    // Listen on on port 7777
            serverSocket = new ServerSocket(7777);

        } catch (IOException e) {

            System.err.println("Could not listen on port: 7777");
            System.exit(-1);

        }

	// Loop forever
        while (true) {

	    /*
	     * Several things going on with this line of code:
	     * 1. Accept a connection (returns a new socket)
	     * 2. Create a new thread of type ServerThread
	     * 3. Call start on the new thread
	     */
	    new ServerThread(serverSocket.accept()).start();
        }
    }
}