CREATE
    OR REPLACE FUNCTION public.gc_add_interval(d timestamp with time zone, num numeric, unit character varying)
    RETURNS timestamp with time zone
    LANGUAGE plpgsql
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
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_blength(field bytea)
    RETURNS numeric
    LANGUAGE plpgsql
AS
$function$
BEGIN
    RETURN OCTET_LENGTH(field);
END;
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_clength(field text)
    RETURNS numeric
    LANGUAGE plpgsql
AS
$function$
BEGIN
    RETURN LENGTH(field);
END;
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_diff_date(t1 timestamp with time zone, t2 timestamp with time zone)
    RETURNS numeric
    LANGUAGE plpgsql
AS
$function$
BEGIN
    RETURN EXTRACT(EPOCH FROM AGE(t1, t2)) / 86400;
END;
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_timestamp()
    RETURNS timestamp without time zone
    LANGUAGE plpgsql
AS
$function$
BEGIN
    RETURN CURRENT_TIMESTAMP;
END;
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_timestamp_tz()
    RETURNS timestamp with time zone
    LANGUAGE plpgsql
AS
$function$
BEGIN
    RETURN CURRENT_TIMESTAMP;
END;
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_to_timestamp(str text, format text)
    RETURNS timestamp without time zone
    LANGUAGE plpgsql
AS
$function$
BEGIN
    RETURN TO_TIMESTAMP(str, format);
END;
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_trunc_date(date timestamp with time zone, format text DEFAULT 'DDD'::text)
    RETURNS timestamp without time zone
    LANGUAGE plpgsql
AS
$function$
BEGIN
    CASE
        WHEN UPPER(format) IN ('SYYYY', 'YYYY', 'YEAR', 'SYEAR', 'YYY', 'YY', 'Y') THEN RETURN date_trunc('year', date);

        WHEN UPPER(format) IN ('Q') THEN RETURN date_trunc('quarter', date);

        WHEN UPPER(format) IN ('MONTH', 'MON', 'MM', 'RM') THEN RETURN date_trunc('month', date);

        WHEN UPPER(format) IN ('DDD', 'DD', 'J') THEN RETURN date_trunc('day', date);

        WHEN UPPER(format) IN ('DAY', 'DY', 'D') THEN RETURN date_trunc('week', date);

        WHEN UPPER(format) IN ('HH', 'HH12', 'HH24') THEN RETURN date_trunc('hour', date);

        WHEN UPPER(format) IN ('MI') THEN RETURN date_trunc('minute', date);
        END CASE;
END;
$function$;

CREATE
    OR REPLACE FUNCTION public.gc_trunc_number(n numeric, d integer DEFAULT 0)
    RETURNS numeric
    LANGUAGE plpgsql
AS
$function$
BEGIN
    RETURN TRUNC(n, d);
END;
$function$;
