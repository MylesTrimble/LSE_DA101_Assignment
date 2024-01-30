SELECT *
FROM public.ad_data
LIMIT 10;

SELECT *
FROM public.ad_data
	WHERE bulkmail_ad = 1
	OR twitter_ad = 1;
	
SELECT
CASE WHEN twitter_ad = 1 THEN 'Twitter'
	 WHEN instagram_ad = 1 THEN 'Instagram'
	 WHEN facebook_ad = 1 THEN 'Facebook' END Advertising_Channel,
	 *
FROM public.ad_data;



-- SOCIAL MEDIA PLATFORM MOST EFFECTIVE METHOD OF ADVERTISING IN EACH COUNTRY --

SELECT
	md.country,
	SUM(twitter_ad) AS twitter_ad,
	SUM(instagram_ad) AS instagram_ad,
	SUM(facebook_ad) AS facebook_ad,
	SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
	COUNT(twitter_ad) + COUNT(instagram_ad) + COUNT(facebook_ad) AS total_number_ads,
	--SUM(bulkmail_ad) AS bulkmail_ad,
	--SUM(brochure_ad) AS brochure_ad,
	COUNT(*) AS total_records
FROM public.ad_data ad
	JOIN marketing_data md USING (id)
GROUP BY md.country
ORDER BY total_records DESC;




-- MOST EFFECTIVE SOCIAL MEDIA BASED ON MARITAL STATUS --

SELECT
	md.marital_status,
	SUM(twitter_ad) AS twitter_ad,
	SUM(instagram_ad) AS instagram_ad,
	SUM(facebook_ad) AS facebook_ad,
	SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
	COUNT(marital_status) AS number_in_each_category
	--SUM(bulkmail_ad) AS bulkmail_ad,
	--SUM(brochure_ad) AS brochure_ad
FROM marketing_data md
	JOIN ad_data ad USING (id)
		WHERE (marital_status IS NOT NULL)
GROUP BY md.marital_status
ORDER BY twitter_ad DESC;




-- MOST EFFECTIVE SOCIAL MEDIA PLATFORM IN EACH COUNTRY --

SELECT
md.country,
'Liquor' Product,
SUM(amt_liq) AS total_spent,
SUM(twitter_ad) AS twitter_ad,
SUM(instagram_ad) AS instagram_ad,
SUM(facebook_ad) AS facebook_ad,
SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
COUNT(*) AS total_records
FROM public.ad_data ad
	JOIN public.marketing_data md USING (id)
		WHERE amt_liq > '0'
GROUP BY md.country
UNION
SELECT
md.country,
'Vegetables' Product,
SUM(amt_veg) AS total_spent,
SUM(twitter_ad) AS twitter_ad,
SUM(instagram_ad) AS instagram_ad,
SUM(facebook_ad) AS facebook_ad,
SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
COUNT(*) AS total_records
FROM public.ad_data ad
	JOIN public.marketing_data md USING (id)
		WHERE amt_veg > '0'
GROUP BY md.country
UNION
SELECT
md.country,
'Meat' Product,
SUM(amt_non_veg) AS total_spent,
SUM(twitter_ad) AS twitter_ad,
SUM(instagram_ad) AS instagram_ad,
SUM(facebook_ad) AS facebook_ad,
SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
COUNT(*) AS total_records
FROM public.ad_data ad
	JOIN public.marketing_data md USING (id)
		WHERE amt_non_veg > '0'
GROUP BY md.country
UNION
SELECT
md.country,
'Fish' Product,
SUM(amt_pes) AS total_spent,
SUM(twitter_ad) AS twitter_ad,
SUM(instagram_ad) AS instagram_ad,
SUM(facebook_ad) AS facebook_ad,
SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
COUNT(*) AS total_records
FROM public.ad_data ad
	JOIN public.marketing_data md USING (id)
		WHERE amt_pes > '0'
GROUP BY md.country
UNION
SELECT
md.country,
'Chocolates' Product,
SUM(amt_chocolates) AS total_spent,
SUM(twitter_ad) AS twitter_ad,
SUM(instagram_ad) AS instagram_ad,
SUM(facebook_ad) AS facebook_ad,
SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
COUNT(*) AS total_records
FROM public.ad_data ad
	JOIN public.marketing_data md USING (id)
		WHERE amt_chocolates > '0'
GROUP BY md.country
UNION
SELECT
md.country,
'Commodities' Product,
SUM(amt_comm) AS total_spent,
SUM(twitter_ad) AS twitter_ad,
SUM(instagram_ad) AS instagram_ad,
SUM(facebook_ad) AS facebook_ad,
SUM(twitter_ad) + SUM(instagram_ad) + SUM(facebook_ad) AS total_successful_ads,
COUNT(*) AS total_records
FROM public.ad_data ad
	JOIN public.marketing_data md USING (id)
		WHERE amt_comm > '0'
GROUP BY md.country
ORDER BY country, total_spent;



-- IN-STORE VS. WEBSITE VISITS --

SELECT
	md.country,
	SUM(md.num_web_buy) AS website_purchases,
	SUM(md.num_walk_in_pur) AS store_purchases,
	SUM(count_success) AS successful_lead_connversions,
	SUM(amt_liq) + SUM(amt_veg) + SUM(amt_non_veg) + SUM(amt_pes) + SUM(amt_chocolates) + SUM(amt_comm) AS total_spent
FROM public.marketing_data md
GROUP BY country
ORDER BY total_spent DESC;