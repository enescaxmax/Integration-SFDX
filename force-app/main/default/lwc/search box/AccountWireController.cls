public  with sharing class AccountWireController {

    
    @AuraEnabled(cacheable= true)
    public static List<Account> getAllRecords1( String name){
        
      List<account> accList = [SELECT id , name  FROM account];  
        
        return accList;
    }
    
    
    @AuraEnabled(cacheable= true)
      public static List<Account> getAllRecords2(String accName){
        
       //  Select  id , name  FROM account  WHERE name LIKE '%f%'


       string query = 'SELECT id , name FROM account WHERE name LIKE \'%' +  accName +'%\'    ';
        system.debug('query :::: ' +  query);



        return database.query(query);
    }
 
    
}