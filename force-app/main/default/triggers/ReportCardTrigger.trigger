trigger ReportCardTrigger on Report_Card__c (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        ReportCardTriggerHandler.overallScore(Trigger.new);
        // ReportCardTriggerHandler trg = new ReportCardTriggerHandler();
        // trg.overallScore(Trigger.new);
    }
}