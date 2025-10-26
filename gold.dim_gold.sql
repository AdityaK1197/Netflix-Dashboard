
CREATE OR ALTER VIEW gold.dim_gold as

with netflixdata as (
select 
a.show_id,
a.type,
a.title,
a.director,
a.country,
a.date_added,
a.release_year,
a.rating,
b.age_group,
a.duration,
a.listed_in,
y.genre,
y.broad_genre
from silver.netflix a
LEFT JOIN silver.category b on a.rating = b.rating
OUTER APPLY (
select TOP 1
x.genre,
x.broad_genre
FROM silver.genre_mapping x
WHERE a.listed_in like '%' + x.genre + '%'
) y
),
imdbdata as (
select 
r.tconst,
r.originalTitle,
r.averagerating,
r.numvotes
FROM (
select 
a.tconst,
b.originalTitle,
a.averagerating,
a.numvotes,
ROW_NUMBER() over (partition BY b.originaltitle order by a.averagerating desc , a.numvotes desc) as rn
FROM silver.imdb_ratings a
LEFT JOIN silver.title_imdb_info b on a.tconst = b.tconst
) r
where rn= 1
)
select 
a.show_id,
a.type,
a.title,
a.director,
a.country,
c.region,
a.date_added,
a.release_year,
a.rating,
a.age_group,
a.duration,
a.listed_in,
a.genre,
a.broad_genre,
COALESCE(b.originaltitle,a.title) as 'originaltitle',
ISNULL(b.averagerating,'2.5') as 'averagerating',
ISNULL(b.numvotes,'20') as 'numvotes'
FROM netflixdata a 
LEFT JOIN imdbdata b on a.title = b.originaltitle
LEFT JOIN silver.country_region_mapping c on a.country = c.country





