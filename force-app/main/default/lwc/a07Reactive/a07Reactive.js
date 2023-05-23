import { LightningElement } from 'lwc';

export default class A07Reactive extends LightningElement {



    ad = "Mahmut"
    handleInput(event){
    this.ad=  event.target.value
    console.log("KOD RENDER EDILDI")
    }










}