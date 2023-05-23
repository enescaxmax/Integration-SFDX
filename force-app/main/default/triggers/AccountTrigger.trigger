trigger AccountTrigger on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete ) {
  SWITCH on Trigger.operationType {
        WHEN BEFORE_INSERT  {}
        WHEN BEFORE_UPDATE  {}
        WHEN BEFORE_DELETE  {}
        WHEN AFTER_INSERT   { AccountTriggerAfterHandler.afterInsertHandler(Trigger.new);}
        WHEN AFTER_UPDATE   {}
        WHEN AFTER_DELETE   {}
        WHEN AFTER_UNDELETE {}  
  }
}