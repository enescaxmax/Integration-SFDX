import { LightningElement } from 'lwc';

export default class A07trackDecorator extends LightningElement {




aileBireyi={
 isim:"Resul",
 yas:49

}


handleInput(event){
   
    this.ad=  event.target.value  
    console.log("KOD RENDER EDILDI")
    }

}