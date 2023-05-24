import { LightningElement , wire } from 'lwc';
import getAllRecords1 from '@salesforce/apex/AccountWireController.getAllRecords1' ;
import getAllRecords2 from '@salesforce/apex/AccountWireController.getAllRecords2' ;

export default class A08wireDecorator extends LightningElement {

   // @wire(getAllRecords1) accList
  
    @wire(getAllRecords2, {accName:'$filter'}) accList

/*
    wiredContacts({data, error}){
        if(data){
            this.contacts = data;
            this.error = undefined;
        }
        else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
*/




    filter='xxxxxxxxxxxxxxx'

    handleAccount(event){
   this.filter = event.target.value


    }

}