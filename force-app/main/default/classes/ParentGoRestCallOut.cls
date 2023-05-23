public class ParentGoRestCallOut {
    public static void retriveMusteri(){
            // Instantiate a new Http object
    Http http = new Http();
        
         // Instantiate a new HTTP request
    // Specify request properties such as the endpoint, the POST method, etc. 
    HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users');
       // request.setBody(body)
        
        HttpResponse response = http.send(request);
        
         System.debug('response.getBody() :>>>>' + response.getBody()); 
        
        System.debug('response.getHeaderKeys() :>>>>' + response.getHeaderKeys());
        System.debug('response.getStatusCode() :>>>>' + response.getStatusCode());
        
        System.debug('response.getHeaderKeys() :>>>>' + response.getHeaderKeys().size());
        
        if(response.getStatusCode() == 200){
           
            String jsonBody = response.getBody();
            
            List<musteriContainer> gelenMusteriContainerList =  (List<musteriContainer>) JSON.deserialize(jsonBody, List<musteriContainer>.class);
            
            System.debug('List<musteriContainer> gelenMusteriContainerList:::>>>'+ gelenMusteriContainerList);
            
            List<Parent__c> parentList = new List<Parent__c>();
            for(musteriContainer mst: gelenMusteriContainerList){
                Parent__c yeniParent = new Parent__c();
                yeniParent.Id_osamigo__c = mst.id;
                yeniParent.Email__c = mst.email;
                yeniParent.status__c = mst.status;
                yeniParent.name = mst.name;
                yeniParent.gender__c= mst.gender;
                parentList.add(yeniParent);
            }
                database.insert(parentList);
                
                
        }else{
            System.debug('error'+ response.getStatusCode());
        }
        
      
    }
}