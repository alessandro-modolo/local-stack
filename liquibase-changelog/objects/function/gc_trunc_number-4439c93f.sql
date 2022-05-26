CREATE OR REPLACE FUNCTION public.gc_trunc_number(n numeric, d integer DEFAULT 0)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN TRUNC(n, d);
END;
$function$
