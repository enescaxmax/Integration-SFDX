import { LightningElement , wire } from 'lwc';
import tumAccountlarGetir3  from '@salesforce/apex/AccountWireController.tumAccountlarGetir3'



export default class A08wireDecorator extends LightningElement {

    @wire(tumAccountlarGetir3)    wiredAccounts


}