import { LightningElement } from 'lwc';

export default class A061Araba extends LightningElement {

arabaMarkasi="TOYOTA"
handleArabaMarkasi(e){

this.arabaMarkasi = e.target.value

}

babadanMotorCinsi=""
handleMotorCinsi(ev){

 this.babadanMotorCinsi=   ev.target.value
}


dedenYakitTuru="SAMAN"
handleYakitTuru(eve){

   this.dedenYakitTuru = eve.target.value 
}
}