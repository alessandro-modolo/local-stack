CREATE OR REPLACE FUNCTION public.gc_to_timestamp(str text, format text)
 RETURNS timestamp without time zone
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN TO_TIMESTAMP(str, format);
END;
$function$
