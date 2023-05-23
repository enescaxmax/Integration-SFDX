public class animalCallout {
public static void retriveAnimals(){
        
        
        Http http = new Http();
  
        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
      
        
        HttpResponse response = http.send(request);
        
       // system.debug('response.getBody() ::::>> ' + response.getBody() );        
        /*
        response.getBody() ::::>> 
         {"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}
  
        */
        if( response.getStatusCode() == 200 ){
       
            String jsonBody = response.getBody(); 
           Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(jsonBody);
          
            //system.debug('Map<String,Object> results ::>> ' + results);
            // Map<String,Object> results ::>> 
            // {    animals=(majestic badger, fluffy bunny, scary bear, chicken)   }
           
            List<Object> animalList = (List<Object>)results.get('animals');
           // system.debug('List<Object> animalList ::>> ' + animalList);
           // List<Object> animalList ::>> (majestic badger, fluffy bunny, scary bear, chicken)
           
            List<animal__c> yeniHayvanList = new List<animal__c>() ; 
              Integer sira = 0 ;
            for(Object animal : animalList){
                  animal__c yeniHayvan = new animal__c();
                  yeniHayvan.name=(string)animal;
                   sira=sira+1;  
                  yenihayvan.eklenmeSirasi__c= sira;
               
                  yeniHayvanList.add(yeniHayvan);
                  }
          
          //  system.debug('List<animal__c> yeniHayvanList::>>  ' + yeniHayvanList );
            /*  List<animal__c> yeniHayvanList::>>  
              ( animal_c:{Name=majestic badger, eklenmeSirasi_c=1}, 
                animal_c:{Name=fluffy bunny, eklenmeSirasi_c=2}, 
                animal_c:{Name=scary bear, eklenmeSirasi_c=3}, 
                animal_c:{Name=chicken, eklenmeSirasi_c=4}
              )deneme yapiyoruzaaaa
          */ 
             insert yeniHayvanList;
            system.debug(' Eklenen hayvan sayisi '+ yeniHayvanList.size());
        }else{
            System.debug(' Kodda hata var!' + response.getStatusCode() );
        }
    }
    
    
    
    
    
}