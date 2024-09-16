public class AccountService {
           public static void updateAccountDescriptions(List<Account> accounts, String newDescription) {
               for (Account acc : accounts) {
                   if (String.isBlank(acc.Description)) {
                       acc.Description = newDescription;
                   }
               }
           }
       }