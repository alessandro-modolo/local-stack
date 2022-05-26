CREATE OR REPLACE FUNCTION public.gc_blength(field bytea)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN OCTET_LENGTH(field);
END;
$function$
