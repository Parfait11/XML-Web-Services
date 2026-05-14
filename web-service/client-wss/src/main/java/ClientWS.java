import proxy.Account;
import proxy.BankAccountService;
import proxy.BankWS;

public class ClientWS {
    public static void main(String[] args) {
        BankAccountService proxyWs = new BankWS().getBankAccountServicePort();
        System.out.println(proxyWs.conversionEuroToDh(200));
        Account account = proxyWs.getAccount(3);
        System.out.println("-----------");
        System.out.println(account.getCode());
        System.out.println(account.getBalance());
        System.out.println(account.getCreatedAt());
    }
}
