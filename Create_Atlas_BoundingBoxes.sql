 --drop table public.temp_oct_bbox;
 --create table public.temp_oct_bbox as (
select 
oct.schnum
, sch.school_name
, sch.elem
, sch.mid
, sch.high
, ST_Envelope(ST_Collect(oct.geom)) as geom

from dpsdata."OctoberCount_Archive" as oct
, public."CCD_Neighborhoods" as h

join dpsdata."Schools_Current" as sch on oct.schnum = sch.schnum

where ST_Intersects(oct.geom, h.geom)
and oct.year = '2016'
group by oct.schnum,sch.school_name,sch.elem, sch.mid, sch.high

--)
