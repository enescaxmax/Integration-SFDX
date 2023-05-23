public class MusteriGoRestPostCallOut {
   
      private static final string END_POINT = 'https://gorest.co.in/public/v2/users/';
    
    @future(callout=true)
     public static void musteriPostKaydet(String isim , string musteriEmail ){
        
       
        Http http = new Http();  //  yeni http olustruduk
      
        HttpRequest request = new HttpRequest();   // yeni request olusturduk
        
        request.setMethod('POST');   // karsi database record eklemek icin methodumuz  POST olmak zorundadir
        request.setEndpoint(END_POINT+'?name='+ isim + '&email=' + musteriEmail +'&status=active&gender=male');
                             // https://gorest.co.in/public/v2/users/    ?name=   Resul yeni   &email=   dsfsafsad@dfsaf  &status=active&gender=male
        
        //  asagidaki iki satir go rest icin gerekli olan Authorization yapilmasi icin yazildi 
         request.setHeader('Authorization', 'Bearer d76e2755ffe26232f550bd5920e3620a537c9252f0333ae7dfa7755750ae3ef9'); 
         request.setHeader('Content-Type', 'application/json; charset=utf-8');
     
        // request.setBody(body)
        
        HttpResponse response = http.send(request);   // requestimizi gonderdik ve gelen kismi response icine kaydeddik.
        
      
       
        if( response.getStatusCode() == 201 ){
       
           // String jsonBody = response.getBody();   //  gelen response icindeki bodyi json formationda kaydettik
         
            system.debug(' karsiya kayit oldu');
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }
    
    //  triggerdan cagirilacak method
 
     public static void musteriPostIdKaydet(ID musteriId){
        
       
        Http http = new Http();  //  yeni http olustruduk
      
        HttpRequest request = new HttpRequest();   // yeni request olusturduk
        
        request.setMethod('POST');   // karsi database record eklemek icin methodumuz  POST olmak zorundadir
        request.setEndpoint(END_POINT);
                             // https://gorest.co.in/public/v2/users/    ?name=   Resul yeni   &email=   dsfsafsad@dfsaf  &status=active&gender=male
        
        //  asagidaki iki satir go rest icin gerekli olan Authorization yapilmasi icin yazildi 
         request.setHeader('Authorization', 'Bearer d76e2755ffe26232f550bd5920e3620a537c9252f0333ae7dfa7755750ae3ef9'); 
         request.setHeader('Content-Type', 'application/json; charset=utf-8');
     
         musteri__c secilenMusteri = [ SELECT ID , name ,status__c , email__c  FROM musteri__c WHERE ID =:musteriId ];
         
         musteriContainer gidecek = new musteriContainer();
         gidecek.name = secilenMusteri.name;
         gidecek.email= secilenMusteri.email__c;
         gidecek.gender = 'male';
         gidecek.status= secilenMusteri.status__c;
         
         
         String json = JSON.serialize(gidecek);
         request.setBody(json);
        
        HttpResponse response = http.send(request);   // requestimizi gonderdik ve gelen kismi response icine kaydeddik.
        
      
       
        if( response.getStatusCode() == 201 ){
       
           // String jsonBody = response.getBody();   //  gelen response icindeki bodyi json formationda kaydettik
         
            system.debug(' karsiya kayit oldu');
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    } 
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*public class MusteriGoRestPostCallout {
   
      private static final string END_POINT = 'https://gorest.co.in/public/v2/users/';
    
    @future(callout=true)
     public static void musteriPostKaydet(String isim , string musteriEmail ){
        
       
        Http http = new Http();  //  yeni http olustruduk
      
        HttpRequest request = new HttpRequest();   // yeni request olusturduk
        
        request.setMethod('POST');   // karsi database record eklemek icin methodumuz  POST olmak zorundadir
        request.setEndpoint(END_POINT+'?name='+ isim + '&email=' + musteriEmail +'&status=active&gender=male');
                             // https://gorest.co.in/public/v2/users/    ?name=   Resul yeni   &email=   dsfsafsad@dfsaf  &status=active&gender=male
        
        //  asagidaki iki satir go rest icin gerekli olan Authorization yapilmasi icin yazildi 
         request.setHeader('Authorization', 'Bearer d76e2755ffe26232f550bd5920e3620a537c9252f0333ae7dfa7755750ae3ef9'); 
         request.setHeader('Content-Type', 'application/json; charset=utf-8');
     
        // request.setBody(body)
        
        HttpResponse response = http.send(request);   // requestimizi gonderdik ve gelen kismi response icine kaydeddik.
        
      
       
        if( response.getStatusCode() == 201 ){
       
           // String jsonBody = response.getBody();   //  gelen response icindeki bodyi json formationda kaydettik
         
            system.debug(' karsiya kayit oldu');
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }
    
    //  triggerdan cagirilacak method
 
     public static void musteriPostIdKaydet(){
        
       
        Http http = new Http();  //  yeni http olustruduk
      
        HttpRequest request = new HttpRequest();   // yeni request olusturduk
        
        request.setMethod('POST');   // karsi database record eklemek icin methodumuz  POST olmak zorundadir
        request.setEndpoint(END_POINT);
                             // https://gorest.co.in/public/v2/users/    ?name=   Resul yeni   &email=   dsfsafsad@dfsaf  &status=active&gender=male
        
        //  asagidaki iki satir go rest icin gerekli olan Authorization yapilmasi icin yazildi 
         request.setHeader('Authorization', 'Bearer d76e2755ffe26232f550bd5920e3620a537c9252f0333ae7dfa7755750ae3ef9'); 
         request.setHeader('Content-Type', 'application/json; charset=utf-8');
     
         musteri__c secilenMusteri = [ SELECT ID , name ,status__c , email__c  FROM musteri__c WHERE ID ='a01Dp000003nsMwIAI' ];
         
         musteriContainer gidecek = new musteriContainer();
         gidecek.name = secilenMusteri.name;
         gidecek.email= secilenMusteri.email__c;
         gidecek.gender = 'male';
         gidecek.status= secilenMusteri.status__c;
         
         
         String json = JSON.serialize(gidecek);
         request.setBody(json);
        
        HttpResponse response = http.send(request);   // requestimizi gonderdik ve gelen kismi response icine kaydeddik.
        
      
       
        if( response.getStatusCode() == 201 ){
       
           // String jsonBody = response.getBody();   //  gelen response icindeki bodyi json formationda kaydettik
         
            system.debug(' karsiya kayit oldu');
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    } 
    
}  */