public class MusteriGoRestCallOut {
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
            
            List<musteri__c> mustList = new List<musteri__c>();
            for(musteriContainer mst: gelenMusteriContainerList){
                musteri__c yeniMust = new musteri__c();
                yeniMust.goRestId__c = mst.id;
                yeniMust.Email__c = mst.email;
                yeniMust.status__c = mst.status;
                yeniMust.name = mst.name;
                mustList.add(yeniMust);
            }
                database.insert(mustList);
                
                
        }else{
            System.debug('error'+ response.getStatusCode());
        }
        
      
                                                                                    
       
    }
/////////////////////////////////////////////////////////////////////////////////////////////    
    Private Static Final String END_POINT = 'https://gorest.co.in/public/v2/users/';
    
    public static void retriveTekMusteri(String musteriId){
       
        // Instantiate a new Http object
    Http http = new Http();
        
         // Instantiate a new HTTP request
    // Specify request properties such as the endpoint, the POST method, etc. 
    HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint(END_POINT + musteriId);
       // request.setBody(body)
        
        HttpResponse response = http.send(request);
        
         System.debug('response.getBody() :>>>>' + response.getBody()); 
        
        System.debug('response.getHeaderKeys() :>>>>' + response.getHeaderKeys());
        System.debug('response.getStatusCode() :>>>>' + response.getStatusCode());
        
        System.debug('response.getHeaderKeys() :>>>>' + response.getHeaderKeys().size());
        
        if(response.getStatusCode() == 200){
           
            String jsonBody = response.getBody();
            
            musteriContainer gelenMusteri = (musteriContainer) JSON.deserialize(jsonBody, musteriContainer.class);
            
          
                musteri__c yeniMust = new musteri__c();
                yeniMust.goRestId__c = gelenMusteri.id;
                yeniMust.Email__c = gelenMusteri.email;
                yeniMust.status__c = gelenMusteri.status;
                yeniMust.name = gelenMusteri.name;
                
            
                database.insert(yeniMust);
                
                
        }else{
            System.debug('error'+ response.getStatusCode());
        }                                                                             
       
    }
    ///////////////////////////////////////////////////////////////////////////////////
       public static void retriveTekMusteriListe(String musteriId){
       
        // Instantiate a new Http object
    Http http = new Http();
        
         // Instantiate a new HTTP request
    // Specify request properties such as the endpoint, the POST method, etc. 
    HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint(END_POINT +'?Id='+ musteriId );
           
       // request.setBody(body)
        
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
           
            String jsonBody = response.getBody();
            
            List<musteriContainer> gelenMusteriContainerList =  (List<musteriContainer>) JSON.deserialize(jsonBody, List<musteriContainer>.class);
            
            System.debug('List<musteriContainer> gelenMusteriContainerList:::>>>'+ gelenMusteriContainerList);
            
            List<musteri__c> mustList = new List<musteri__c>();
            for(musteriContainer mst: gelenMusteriContainerList){
                musteri__c yeniMust = new musteri__c();
                yeniMust.goRestId__c = mst.id;
                yeniMust.Email__c = mst.email;
                yeniMust.status__c = mst.status;
                yeniMust.name = mst.name;
                mustList.add(yeniMust);
            }
                database.insert(mustList);
                
                
        }else{
            System.debug('error'+ response.getStatusCode());
        }
        
      
                                                                                    
       
    }
    
}