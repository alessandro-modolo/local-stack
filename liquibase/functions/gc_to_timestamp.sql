CREATE
OR REPLACE FUNCTION public.gc_to_timestamp(str text, format text)
    RETURNS timestamp without time zone
AS
$function$
BEGIN
RETURN TO_TIMESTAMP(str, format);
END;
$function$ LANGUAGE plpgsql;
