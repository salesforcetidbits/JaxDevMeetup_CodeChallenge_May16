@isTest
public class AccountService_test{
    
    static testmethod void insertNewAccount_positive(){

        String validArg = 'Salesforce Rocks!';

        // Verify no accounts exist
        System.assertEquals(0, [select id from Account].size());

        System.Test.StartTest();
            Account newAccount = AccountService.insertNewAccount(validArg);
        System.Test.StopTest();

        // Verify only one account was created (process builder and triggers could be creating additional accounts)
        System.assertEquals(1, [select id from Account].size(), 'Check process automation logic for Accounts, possible insert recursion');

        // Ensure account name is as expected
        System.assertEquals(validArg , [select id from Account][0].Name, 'Unexpected account name');
    }

    static testmethod void insertNewAccount_negative_1(){

        String invalidArg;

        // Verify no accounts exist
        System.assertEquals(0, [select id from Account].size());

        System.Test.StartTest();
            Account newAccount = AccountService.insertNewAccount(invalidArg);
        System.Test.StopTest();

        // Verify no accounts were created
        System.assertEquals(0, [select id from Account].size(), 'Null arg created account');
    }

    static testmethod void insertNewAccount_negative_2(){

        String invalidArg = '';

        // Verify no accounts exist
        System.assertEquals(0, [select id from Account].size());

        System.Test.StartTest();
            Account newAccount = AccountService.insertNewAccount(invalidArg);
        System.Test.StopTest();

        // Verify no accounts were created
        System.assertEquals(0, [select id from Account].size(), 'Empty String created an account');
    }
}
