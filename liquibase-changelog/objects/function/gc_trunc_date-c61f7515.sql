CREATE OR REPLACE FUNCTION public.gc_trunc_date(date timestamp with time zone, format text DEFAULT 'DDD'::text)
 RETURNS timestamp without time zone
 LANGUAGE plpgsql
AS $function$
BEGIN
    CASE
    WHEN UPPER(format) IN ('SYYYY', 'YYYY', 'YEAR', 'SYEAR', 'YYY', 'YY', 'Y') THEN 
        RETURN date_trunc('year', date);

    WHEN UPPER(format) IN('Q') THEN 
        RETURN date_trunc('quarter', date);

    WHEN UPPER(format) IN('MONTH', 'MON', 'MM', 'RM') THEN 
        RETURN date_trunc('month', date);

    WHEN UPPER(format) IN('DDD', 'DD', 'J') THEN 
        RETURN date_trunc('day', date);

    WHEN UPPER(format) IN('DAY', 'DY', 'D') THEN 
        RETURN date_trunc('week', date);

    WHEN UPPER(format) IN('HH', 'HH12', 'HH24') THEN 
        RETURN date_trunc('hour', date);

    WHEN UPPER(format) IN('MI') THEN 
        RETURN date_trunc('minute', date);
    END CASE;
END;
$function$
