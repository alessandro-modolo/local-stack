CREATE
OR REPLACE FUNCTION public.gc_blength(field bytea)
    RETURNS numeric
AS
$function$
BEGIN
RETURN OCTET_LENGTH(field);
END;
$function$ LANGUAGE plpgsql;
