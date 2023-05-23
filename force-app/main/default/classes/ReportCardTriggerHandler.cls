public class ReportCardTriggerHandler {
    public static void overallScore(List<Report_Card__c> reportCardList){
        for(Report_Card__c repCard : reportCardList){
            Boolean bl = (repCard.English__c < 0 || repCard.English__c > 100) ||
            (repCard.Geography__c < 0 || repCard.Geography__c > 100) ||
            (repCard.History__c < 0 || repCard.History__c > 100) ||
            (repCard.Math__c < 0 || repCard.Math__c > 100);
            if(bl){
                repCard.addError('Enter a valid mark!');
            }else if(repCard.Average__c < 40 || repCard.Math__c < 40 || repCard.English__c < 40){
                repCard.Overall_Score__c = 'Fail';
            }else if(repCard.Average__c < 60){
                repCard.Overall_Score__c = 'Pass';
            }else if(repCard.Average__c < 80){
                repCard.Overall_Score__c = 'Good';
            }else if(repCard.Average__c <= 100){
                repCard.Overall_Score__c = 'Excellent';
            }
        }
    }
}