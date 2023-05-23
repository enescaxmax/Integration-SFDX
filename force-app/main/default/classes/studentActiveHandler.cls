public class studentActiveHandler {
    public static void activeStudents(List<Student__c> activeStudentList){
        Set<Id> parentIdSet = new Set<Id>();
              
        for(Student__c std:activeStudentList){
            
            parentIdSet.add(std.Parent__c);
           
        }
        List<Parent__c> newPrntList = new List<Parent__c>();
            for(Parent__c prnt:[SELECT id,name,Child_Number__c, (SELECT Id FROM Students__r WHERE isActive__c=true ) FROM Parent__c WHERE Id IN: parentIdSet]){
            
            prnt.Child_Number__c=prnt.Students__r.size();
            newPrntList.add(prnt);
            
        }update newPrntList;
  }
    
}