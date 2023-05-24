import { LightningElement , track} from 'lwc';

export default class A072trackWithList extends LightningElement {



    @track
    familyMemberList = [

            {
                id:1,
                name:'Resul',
                age:49
            
            }
        ]

 firstName=''

 handleName(e){
    this.firstName = e.target.value
 }


memberAge=0 
handleAge(ev){

this.memberAge= ev.target.value
}


num= 2
handleClick(e){

    const familyMember= {
                    id:this.num,
                    name: this.firstName,
                    age:this.memberAge
                
                    }

    this.familyMemberList.push(familyMember)

  this.num++

}






}