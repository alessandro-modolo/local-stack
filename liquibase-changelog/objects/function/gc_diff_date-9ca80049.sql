CREATE OR REPLACE FUNCTION public.gc_diff_date(t1 timestamp with time zone, t2 timestamp with time zone)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN EXTRACT(EPOCH FROM AGE(t1, t2))/86400;
END;
$function$
