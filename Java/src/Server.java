import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Server {
    public Server(Socket socket, int ReducerNo) {}

    public static void main(String[] args) throws IOException {

        int port = 9999;
        int ReducerNo = 1;

        ServerSocket serverSocket = new ServerSocket(port);

        /** 创建线程池 */
        ExecutorService exec = Executors.newCachedThreadPool();

        try {
            while (true) {
                Socket socket = serverSocket.accept();
                exec.execute(new singleServer(socket,ReducerNo));
                ReducerNo++;
            }
        } finally {
            serverSocket.close();
        }
    }
}

class singleServer implements Runnable {

    private Socket socket;
    private int ReducerNo;

    public singleServer(Socket socket, int ReducerNo) {
        this.socket = socket;
        this.ReducerNo = ReducerNo;
    }

    @Override
    public void run() {
        try {
            DataInputStream input = new DataInputStream(
                    new BufferedInputStream(socket.getInputStream()));
            DataOutputStream output = new DataOutputStream(
                    new BufferedOutputStream(socket.getOutputStream()));

            do {
                String message = input.readUTF();
                System.out.println("Reducer " + ReducerNo + " is " + message);
            } while (true);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Disconnect from the Reducer " + ReducerNo);
            try {
                socket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}