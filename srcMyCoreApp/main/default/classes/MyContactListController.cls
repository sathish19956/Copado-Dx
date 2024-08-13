public class MyContactListController {

    
    //Conflicts testing first testin by another user
    @AuraEnabled
public static List<Contact> getContacts(Id recordId) {
   return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId = :recordId];
}
}