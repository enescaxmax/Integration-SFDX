@RestResource(UrlMapping='/cases/*')
global class caseProviderManager {
       
     /*   to provide the url  we have   System.debug(System.Url.getSalesforceBaseUrl());     
        // Url:[delegate=https://wise36-dev-ed.develop.my.salesforce.com]     /services/apexrest/xxxxxObjectName
        
         https://wise36-dev-ed.develop.my.salesforce.com/services/apexrest/cases
       
      */
    /*
    to fetch session ID    System.debug(System.UserInfo.getSessionId().substring(15));
   //     !AQ0AQH5wyvgk2_3mclWg8KONcZD_Ky1_vnQU5m9otqfimyR.DXzjiWcRnQOtClWjFZz.JIBfA9JaoV9sd.RgD7FRCK1d7HO_
 //       !AQ0AQDjLn5dmLqIY.M6QmGryVXvdYVrX9cpxfFtnP0O0R3kfdVRu5Zs6.mMJa6VKNlIOX_11izvkvQsFdWi8ThPU7Kfv7hN.
     */
    
    
    @HttpGet
    global static List<Case> caseProviderforGET(){
       /* 
        RestRequest req = RestContext.request;
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
      
     List<Case> caseList = [SELECT Id, Status, Reason, Subject FROM case WHERE Id = :caseId];
        
    
        
        if ( !caseList.isEmpty() && caseList != null) {
          return caseList; 
        }else {
          return caseList = [SELECT Id, Status, Reason, Subject, Type FROM Case LIMIT 4];
        }
  */
     /*
    
       List<Case> caseList = new List<case>();
         Case caseToBeshown ;
        RestRequest req = RestContext.request;
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        if(caseId.length() == 18  ) {
            caseToBeshown = [SELECT Id, Status, Reason, Subject FROM case WHERE Id = :caseId];
        }
        if ( caseToBeshown != null && !caseToBeshown.isEmpty ) {
              caseList.add(caseToBeshown);
        }else {
          caseList = [SELECT Id, Status, Reason, Subject, Type FROM Case LIMIT 4];
        }
       return caseList;    
*/
      
      
         string newId;
        RestRequest request = RestContext.request; 
      
       Map<String,Object> params= (Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        Set<string> keysOFMap = params.keyset();
        
        for(String fieldName : keysOFMap){
            if( fieldName.toLowerCase() == 'id'){
                newId = params.get(fieldName).toString();
            }
      }
        
       List<Case> caseList = [SELECT Id, Status, Reason, Subject FROM case WHERE Id = :newId];
    
        
        if ( !caseList.isEmpty() && caseList != null) {
          return caseList; 
        }else {
          return caseList = [SELECT Id, Status, Reason, Subject, Type FROM Case LIMIT 4];
        } 
        
    }
    
   
    
    
     @HttpDelete
      global static STRING caseProviderForDELETE(){
      
        RestRequest req = RestContext.request;
       // RestResponse res = RestContext.response;
       
                           //                https://gorest.co.in/public/v2/users/1440183
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
       
          Case caseToBeDeleted = [SELECT Id FROM case WHERE Id = :caseId];
        delete  caseToBeDeleted;
          
         return ' congrats  you have deleted single record!!'; 
    }
    
    
    
    
    @HttpPost
    global static case doPost(String Subject, String Status, String Origin) {
       
        case newCase = new case();
        newCase.Subject = Subject;
        newCase.Status = Status;
        newCase.Origin = Origin;
        insert newCase;
        
        return newCase;
    }
    
    
    @HttpPut
    global static case doPut(String Subject, String Status, String Origin , String id) {
       
        case newCase = new case();
        newCase.id = id;
        newCase.Subject = Subject;
        newCase.Status = Status;
        newCase.Origin = Origin;
        upsert newCase;
        return newCase;
    }
    
    
     @HttpPatch
    global static case updateCase(){
        RestRequest request = RestContext.request; 
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
        Case caseToUpdate = [Select id FROM case WHERE Id=:caseId];
      
       Map<String,Object> params= (Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        Set<string> keysOFMap = params.keyset();
        
        for(String fieldName : keysOFMap){
            caseToUpdate.put(fieldName, params.get(fieldName));
            
        }
        update caseToUpdate;
        
        return caseToUpdate;
        
    }
    
  
}