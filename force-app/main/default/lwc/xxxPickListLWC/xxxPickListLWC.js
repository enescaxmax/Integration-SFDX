import { LightningElement } from 'lwc';

export default class XxxPickListLWC extends LightningElement {

secilen='';
seceneklerArray= [ {label : 'TURKIYE' , value:'Ankara'},
                   {label : 'FRANSA' , value:'Paris'}
                ]

get secenekler(){

    return this.seceneklerArray
} 

handlePicklist(event){

    this.secilen = event.detail.value;
}

}