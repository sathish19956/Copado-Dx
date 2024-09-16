@IsTest
private class AccountServiceTest {
    @IsTest
    static void testUpdateAccountDescriptions() {
        // Prepare test data
        List<Account> testAccounts = new List<Account>{
            new Account(Name = 'Test Account 1'),
            new Account(Name = 'Test Account 2', Description = 'Existing Description'),
            new Account(Name = 'Test Account 3')
        };
        insert testAccounts;
        
        // Execute the method to test
        Test.startTest();
        AccountService.updateAccountDescriptions(testAccounts, 'New Description');
        Test.stopTest();
        
        // Verify the results
        List<Account> updatedAccounts = [SELECT Id, Name, Description FROM Account WHERE Id IN :testAccounts];
        
        System.assertEquals('New Description', updatedAccounts[0].Description, 'Account 1 should have the new description');
        System.assertEquals('Existing Description', updatedAccounts[1].Description, 'Account 2 should retain its existing description');
        System.assertEquals('New Description', updatedAccounts[2].Description, 'Account 3 should have the new description');
    }
}