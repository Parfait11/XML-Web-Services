import jakarta.xml.ws.Endpoint;
import ws.BankAccountService;

public class ServerJWS {

    public static void main(String[] args) {
        String url = "http://127.0.0.1:8282/";
        Endpoint.publish(url, new BankAccountService());
        System.out.println("Bank account service is published on "+ url);
    }
}
