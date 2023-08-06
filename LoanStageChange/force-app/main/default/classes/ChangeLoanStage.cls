public with sharing class ChangeLoanStage {
    @AuraEnabled
    public static Boolean changeStage(String id){
        Loan__c loan = [SELECT Loan_Stage__c from Loan__c WHERE id = :id];
        if( loan.Loan_Stage__c == 'New')
        {
            loan.Loan_Stage__c= 'In Discussion';
        }
        else if(loan.Loan_Stage__c == 'In Discussion') {
            loan.Loan_Stage__c='Submitted for Approval';
        }
        else if(loan.Loan_Stage__c == 'Submitted for Approval') {
            loan.Loan_Stage__c='Approved';
        }
        else if(loan.Loan_Stage__c == 'Approved') {
            loan.Loan_Stage__c='Disbursed';
        }
        else if(loan.Loan_Stage__c == 'Disbursed') {
            loan.Loan_Stage__c='Closed';
        }
        
        try {
            update loan;
            return true;
            
        } catch (Exception e) {
            return false;
        } 
    }
}