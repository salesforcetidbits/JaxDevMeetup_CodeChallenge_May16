public with sharing class AccountService{
    
    public static Account insertNewAccount(String arg){

        Account newAccount = new Account(name = arg);

        try{
            insert newAccount;
        }
        catch(DMLException e){
            return null;
        }

        return newAccount;
    }
}