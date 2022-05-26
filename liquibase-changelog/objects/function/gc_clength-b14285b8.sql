CREATE OR REPLACE FUNCTION public.gc_clength(field text)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN LENGTH(field);
END;
$function$
