import { LightningElement, track } from 'lwc';

export default class A07trackList extends LightningElement {

isim=''

handleIsim(event){

this.isim=event.target.value

}

yas=0
handleYas(e){
this.yas = e.target.value

}

@track //  tarck decorator listeyi reactive yapti  yani buraya yeni eleman ekleyebilrim
    aileBireyleri = [

            {
                id:1,
                name:'Resul',
                yas:49
                
            } 
        ]

sayi=2
handleClick(e){
const birey =    {
                  id:this.sayi,
                  name:this.isim,
                  yas:this.yas
                
                } 

this.aileBireyleri.push(birey);
this.sayi++
}




}