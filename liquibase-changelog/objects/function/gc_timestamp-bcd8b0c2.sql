CREATE OR REPLACE FUNCTION public.gc_timestamp()
 RETURNS timestamp without time zone
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN CURRENT_TIMESTAMP;
END;
$function$
