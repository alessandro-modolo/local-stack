CREATE
OR REPLACE FUNCTION public.gc_timestamp_tz()
    RETURNS timestamp with time zone
AS
$function$
BEGIN
RETURN CURRENT_TIMESTAMP;
END;
$function$ LANGUAGE plpgsql;
