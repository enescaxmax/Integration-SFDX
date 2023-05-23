import { LightningElement } from 'lwc';

export default class A03ConditionalRendering extends LightningElement {

    
flag=true;
handleChange(ev){
    this.flag = ev.target.checked
}




}