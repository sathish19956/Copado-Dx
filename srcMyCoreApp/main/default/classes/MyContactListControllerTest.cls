@isTest
private class MyContactListControllerTest {
    @isTest static void testGetContacts() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        //Conflicts testing by another user

        Contact contact1 = new Contact(FirstName = 'John', LastName = 'Smith', Email = 'john.smith@example.com', Phone = '1234567890', AccountId = testAccount.Id);
        Contact contact2 = new Contact(FirstName = 'Jane', LastName = 'Doe', Email = 'jane.doe@example.com', Phone = '0987654321', AccountId = testAccount.Id);
        insert new List<Contact>{contact1, contact2};

        // Test start
        Test.startTest();
        List<Contact> contacts = MyContactListController.getContacts(testAccount.Id);
        Test.stopTest();
        
        //Conflicts testing by another user

        // Assertions
        System.assertEquals(2, contacts.size(), 'There should be two contacts related to the test account.');
        System.assertEquals('John', contacts[0].FirstName, 'The first contact\'s first name should be John.');
        System.assertEquals('Smith', contacts[0].LastName, 'The first contact\'s last name should be Smith.');
        System.assertEquals('Jane', contacts[1].FirstName, 'The second contact\'s first name should be Jane.');
        System.assertEquals('Doe', contacts[1].LastName, 'The second contact\'s last name should be Doe.');
    }
}