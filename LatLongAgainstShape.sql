WITH
  vars AS (
  SELECT
    ST_GeogFromGeoJSON(geog) AS x
  FROM
    newleads.cleaned
  WHERE
    cnt="0"),
  varis AS (
  SELECT
    ST_GeogFromGeoJSON(geog) AS y
  FROM
    newleads.cleaned
  WHERE
    cnt="00"),
  varibs AS (
  SELECT
    ST_GeogFromGeoJSON(geog) AS z
  FROM
    newleads.cleaned
  WHERE
    cnt="000" )
SELECT
  companyname,
  contactid,
  dealamount,
  ST_Contains(x,
    ST_GeogPoint(longitude,
      latitude )) AS Geogcheck,
  ST_Contains(y,
    ST_GeogPoint(longitude,
      latitude )) AS GeogcheckTwo,
  ST_Contains(z,
    ST_GeogPoint(longitude,
      latitude )) AS GeogcheckThree
FROM
  newleads.withlatlong,
  vars,
  varis,
  varibs
WHERE
 latitude IS NOT NULL
