import { LightningElement } from 'lwc';

export default class A2DataBinding extends LightningElement {

  isim = "Enes Bey" 
  ad = "Mahmut Bey" 
  handleInput(event){
this.ad = event.target.value
  }

ilkIsim="" ;
soyIsim="" ;
tamIsim= "" ;


handleIsim(event){
    this.ilkIsim = event.target.value
      }

handleSoyIsim(event){
        this.soyIsim = event.target.value
          }

get fullName(){
this.tamIsim = this.ilkIsim.toUpperCase() +" "+this.soyIsim ;
return this.tamIsim ;
}


ilkNumber="" ;
ikinciNumber="" ;
toplamNumber= "" ;


handleFirstNumber(event){
    this.ilkNumber = event.target.value
      }

      handleSecondNumber(event){
        this.ikinciNumber = event.target.value
          }

get fullNumber(){
    
return parseInt(this.ilkNumber)+ parseInt(this.ikinciNumber) ;
}



}