CREATE OR REPLACE PROCEDURE copy_data_with_loop(source_table_name TEXT, destination_table_name TEXT) AS $$
DECLARE
    source_record RECORD;
BEGIN

    FOR source_record IN SELECT * FROM source_table_name
	LOOP
     INSERT INTO destination_table_name VALUES (source_record.*);
    END LOOP;

    RAISE NOTICE 'Data copied from % to % successfully.', source_table_name, destination_table_name;
EXCEPTION
    WHEN OTHERS THEN
     RAISE EXCEPTION 'Error copying data: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;
