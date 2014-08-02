SET LOCK_MODE 3;               
SET CACHE_SIZE 33107;          
;              
CREATE USER IF NOT EXISTS SA PASSWORD '' ADMIN;
CREATE CACHED TABLE PUBLIC.TCONDITION(
    ID VARCHAR(255) NOT NULL,
    ACTIVE BOOLEAN DEFAULT TRUE,
    DESCRIPTION VARCHAR(128000),
    TRIGGER_TRIGGER_ID_OID VARCHAR(255),
    VALUE VARCHAR(255)
);      
ALTER TABLE PUBLIC.TCONDITION ADD CONSTRAINT PUBLIC.TCONDITION_PK PRIMARY KEY(ID);             
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TCONDITION;               
CREATE INDEX PUBLIC.INDEX_AID_TCONDITION_DESCRIPTION ON PUBLIC.TCONDITION(DESCRIPTION);        
CREATE INDEX PUBLIC.INDEX_AID_TCONDITION_VALUE ON PUBLIC.TCONDITION(VALUE);    
CREATE INDEX PUBLIC.TCONDITION_N49 ON PUBLIC.TCONDITION(TRIGGER_TRIGGER_ID_OID);               
CREATE INDEX PUBLIC.INDEX_AID_TCONDITION_ACTIVE ON PUBLIC.TCONDITION(ACTIVE);  
CREATE CACHED TABLE PUBLIC.TACTION(
    ID VARCHAR(255) NOT NULL,
    ACTIVE BOOLEAN DEFAULT TRUE,
    DESCRIPTION VARCHAR(128000),
    TRIGGER_TRIGGER_ID_OID VARCHAR(255),
    VALUE VARCHAR(255)
);         
ALTER TABLE PUBLIC.TACTION ADD CONSTRAINT PUBLIC.TACTION_PK PRIMARY KEY(ID);   
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TACTION;  
CREATE INDEX PUBLIC.INDEX_AID_TACTION_ACTIVE ON PUBLIC.TACTION(ACTIVE);        
CREATE INDEX PUBLIC.TACTION_N49 ON PUBLIC.TACTION(TRIGGER_TRIGGER_ID_OID);     
CREATE INDEX PUBLIC.INDEX_AID_TACTION_VALUE ON PUBLIC.TACTION(VALUE);          
CREATE INDEX PUBLIC.INDEX_AID_TACTION_DESCRIPTION ON PUBLIC.TACTION(DESCRIPTION);              
CREATE CACHED TABLE PUBLIC.TRIGGER(
    TRIGGER_ID VARCHAR(255) NOT NULL,
    ACTIVE BOOLEAN,
    APPLIES_TO VARCHAR(255),
    DESCRIPTION VARCHAR(128000),
    EXECUTION_OCCURS VARCHAR(255),
    PROCESSING_ORDER VARCHAR(255),
    TARGETMODULE VARCHAR(255)
);             
ALTER TABLE PUBLIC.TRIGGER ADD CONSTRAINT PUBLIC.TRIGGER_PK PRIMARY KEY(TRIGGER_ID);           
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TRIGGER;  
CREATE INDEX PUBLIC.INDEX_AID_TRIGGER_DESCRIPTION ON PUBLIC.TRIGGER(DESCRIPTION);              
CREATE INDEX PUBLIC.INDEX_AID_TRIGGER_EXECUTION_OCCURS ON PUBLIC.TRIGGER(EXECUTION_OCCURS);    
CREATE INDEX PUBLIC.INDEX_AID_TRIGGER_PROCESSING_ORDER ON PUBLIC.TRIGGER(PROCESSING_ORDER);    
CREATE INDEX PUBLIC.INDEX_AID_TRIGGER_TARGETMODULE ON PUBLIC.TRIGGER(TARGETMODULE);            
CREATE INDEX PUBLIC.INDEX_AID_TRIGGER_APPLIES_TO ON PUBLIC.TRIGGER(APPLIES_TO);
CREATE INDEX PUBLIC.INDEX_AID_TRIGGER_ACTIVE ON PUBLIC.TRIGGER(ACTIVE);        
ALTER TABLE PUBLIC.TCONDITION ADD CONSTRAINT PUBLIC.TCONDITION_FK1 FOREIGN KEY(TRIGGER_TRIGGER_ID_OID) REFERENCES PUBLIC.TRIGGER(TRIGGER_ID) NOCHECK;          
ALTER TABLE PUBLIC.TACTION ADD CONSTRAINT PUBLIC.TACTION_FK1 FOREIGN KEY(TRIGGER_TRIGGER_ID_OID) REFERENCES PUBLIC.TRIGGER(TRIGGER_ID) NOCHECK;
