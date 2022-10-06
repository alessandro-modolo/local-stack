CREATE
OR REPLACE FUNCTION public.gc_clength(field text)
    RETURNS numeric
AS
$function$
BEGIN
RETURN LENGTH(field);
END;
$function$ LANGUAGE plpgsql;
