import java.io.*;
import java.net.Socket;
import java.util.Random;

public class Reducer {
    private Socket socket;
    private OutputStream out;
    String message;     //忙碌状态
    Boolean isBusy;

    public Reducer(){
        try {
            socket = new Socket("localhost", 9999);
            out = socket.getOutputStream();
            DataOutputStream output = new DataOutputStream(
                    new BufferedOutputStream(socket.getOutputStream()));

            while (true) {
                try {
                    /** 随机指定减速机状态 */
                    Random random = new Random();
                    isBusy = random.nextBoolean();

                    /** 向服务器发送状态信息 */
                    if (isBusy) {
                        Thread.sleep(1000);     //服务器繁忙则暂停上传数据
                        message = "busy，paused for a second";
                        output.writeUTF(message);
                        output.flush();
                    } else {
                        message = "free";
                        output.writeUTF(message);
                        output.flush();
                    }
                    Thread.sleep(2000);     //每两秒自检一次
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args){
        Reducer reducer = new Reducer();
    }
}