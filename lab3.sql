--функция
CREATE OR REPLACE FUNCTION log_egg_state_change()
RETURNS TRIGGER AS $$
BEGIN
IF NEW.state <> OLD.state THEN
INSERT INTO egg_log (egg_id, old_state, new_state)
        		VALUES (OLD.id, OLD.state, NEW.state);
    	END IF;
    	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--тригер
CREATE TRIGGER trigger_egg_state_change
AFTER UPDATE ON egg
FOR EACH ROW
EXECUTE FUNCTION log_egg_state_change();
-------
UPDATE egg
SET state = 'cracked'
WHERE id = 1;
UPDATE 1
-------
UPDATE egg
SET state = 'hatched'
WHERE id = 1;
UPDATE 1
