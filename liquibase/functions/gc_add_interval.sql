CREATE
OR REPLACE FUNCTION public.gc_add_interval(d timestamp with time zone, num numeric, unit character varying)
    RETURNS timestamp with time zone
AS
$function$
BEGIN
CASE upper(unit)
        WHEN 'SECOND' THEN RETURN d + num * INTERVAL '1 second';
WHEN 'MINUTE' THEN RETURN d + num * INTERVAL '1 minute';
WHEN 'HOUR' THEN RETURN d + num * INTERVAL '1 hour';
WHEN 'DAY' THEN RETURN d + num * INTERVAL '1 day';
END CASE;
END;
$function$ LANGUAGE plpgsql;
