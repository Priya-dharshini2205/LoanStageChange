import { LightningElement,api } from 'lwc';
import changeStage from '@salesforce/apex/ChangeLoanStage.changeStage'
export default class StageChange extends LightningElement {
   
@api recordId;
status=false;
    handleClick() {
        changeStage({id:this.recordId})
          .then((data) => {
            this.status=true;
             console.log(data);
             window.location.reload()
          })
          .catch((error) => {
            this.status=false;
            console.log(error);
          });
          
    }
}