CREATE
OR REPLACE FUNCTION public.gc_trunc_number(n numeric, d integer DEFAULT 0)
    RETURNS numeric
AS
$function$
BEGIN
RETURN TRUNC(n, d);
END;
$function$ LANGUAGE plpgsql;
