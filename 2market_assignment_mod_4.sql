SELECT *
FROM public.marketing_data md;


/* TOTAL SPEND PER COUNTRY PER PRODUCT */

CREATE TABLE spend_per_country AS
SELECT country,
	SUM(amt_liq) AS total_amount_alcohol,
	SUM(amt_veg) AS total_amount_vegetables,
	SUM(amt_non_veg) AS total_amount_meat,
	SUM(amt_pes) AS total_amount_fish,
	SUM(amt_chocolates) AS total_amount_chocolate,
	SUM(amt_comm) AS total_amount_commodities,
		SUM(amt_liq) + SUM(amt_veg) + SUM(amt_non_veg) + SUM(amt_pes) + SUM(amt_chocolates) + SUM(amt_comm) AS total_spend_per_country
FROM public.marketing_data
	GROUP BY country
	ORDER BY total_spend_per_country DESC;

SELECT * FROM spend_per_country;

/* JUST TOTAL SPEND PER COUNTRY */

SELECT country,
	SUM(amt_liq) + SUM(amt_veg) + SUM(amt_non_veg) + SUM(amt_pes) + SUM(amt_chocolates) + SUM(amt_comm) AS total_spend_per_country
FROM public.marketing_data
	GROUP BY country
	ORDER BY total_spend_per_country DESC;

/* NUMBER OF CUSTOMERS PER COUNTRY */

SELECT country,
	COUNT(id) AS number_of_customers
FROM public.marketing_data
	GROUP BY country
	ORDER BY number_of_customers DESC;


/* TOTAL SPEND PER PRODUCT PER COUNTRY */

CREATE VIEW spend_per_product_per_country_view AS
SELECT country,
	'Alcohol' Product,
	SUM(amt_liq) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Vegetables' Product,
	SUM(amt_veg) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Meat' Product,
	SUM(amt_non_veg) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Fish' Product,
	SUM(amt_pes) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Chocolate' Product,
	SUM(amt_chocolates) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Commodities' Product,
	SUM(amt_comm) AS total_spent
FROM public.marketing_data
	GROUP BY country;
	
SELECT * FROM spend_per_product_per_country_view;

/* MOST POPULAR PRODUCTS IN EACH COUNTRY */

CREATE VIEW most_popular_products_in_each_country_v AS
SELECT country,
	'Alcohol' Product,
	SUM(amt_liq) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Vegetables' Product,
	SUM(amt_veg) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Meat' Product,
	SUM(amt_non_veg) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Fish' Product,
	SUM(amt_pes) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Chocolate' Product,
	SUM(amt_chocolates) AS total_spent
FROM public.marketing_data
	GROUP BY country
UNION ALL
SELECT country,
	'Commodities' Product,
	SUM(amt_comm) AS total_spent
FROM public.marketing_data
	GROUP BY country
	ORDER BY total_spent DESC;
	
SELECT * FROM most_popular_products_in_each_country_v;

/* VIEW TOTAL AMOUNT OF WEBSITE / STORE PURCHASES */

SELECT country,
	SUM(num_visits) AS website_visits,
	SUM(num_web_buy) AS website_purchases,
	SUM(num_walk_in_pur) AS in_store_purchases
FROM public.marketing_data
	GROUP BY country;

/* MOST POPULAR PRODUCTS BASED ON MARITAL STATUS */

CREATE VIEW most_popular_products_marital_status_v AS
SELECT country, marital_status,
	'Alcohol' Product,
	SUM(amt_liq) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status, country
UNION ALL
SELECT country, marital_status,
	'Vegetables' Product,
	SUM(amt_veg) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status, country
UNION ALL
SELECT country, marital_status,
	'Meat' Product,
	SUM(amt_non_veg) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status, country
UNION ALL
SELECT country, marital_status,
	'Fish' Product,
	SUM(amt_pes) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status, country
UNION ALL
SELECT country, marital_status,
	'Chocolate' Product,
	SUM(amt_chocolates) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status, country
UNION ALL
SELECT country, marital_status,
	'Commodities' Product,
	SUM(amt_comm) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status, country
	ORDER BY total_spent DESC LIMIT 50;

///////////

CREATE VIEW most_popular_products_marital_status_v AS
SELECT marital_status,
	'Alcohol' Product,
	SUM(amt_liq) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status
UNION ALL
SELECT marital_status,
	'Vegetables' Product,
	SUM(amt_veg) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status
UNION ALL
SELECT marital_status,
	'Meat' Product,
	SUM(amt_non_veg) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status
UNION ALL
SELECT marital_status,
	'Fish' Product,
	SUM(amt_pes) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status
UNION ALL
SELECT marital_status,
	'Chocolate' Product,
	SUM(amt_chocolates) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status
UNION ALL
SELECT marital_status,
	'Commodities' Product,
	SUM(amt_comm) AS total_spent
FROM public.marketing_data
	GROUP BY marital_status
	ORDER BY total_spent DESC;

SELECT * FROM most_popular_products_marital_status_v;



/* MOST POPULAR PRODUCTS BASED ON KIDS / TEENS IN HOME */

CREATE VIEW most_popular_products_kids_teens_v AS
SELECT kid_home AS number_of_kids, teen_home AS number_of_teens,
	'Alcohol' Product,
	SUM(amt_liq) AS total_spent
FROM public.marketing_data
	GROUP BY kid_home, teen_home
UNION ALL
SELECT kid_home AS number_of_kids, teen_home AS number_of_teens,
	'Vegetables' Product,
	SUM(amt_veg) AS total_spent
FROM public.marketing_data
	GROUP BY kid_home, teen_home
UNION ALL
SELECT kid_home AS number_of_kids, teen_home AS number_of_teens,
	'Meat' Product,
	SUM(amt_non_veg) AS total_spent
FROM public.marketing_data
	GROUP BY kid_home, teen_home
UNION ALL
SELECT kid_home AS number_of_kids, teen_home AS number_of_teens,
	'Fish' Product,
	SUM(amt_pes) AS total_spent
FROM public.marketing_data
	GROUP BY kid_home, teen_home
UNION ALL
SELECT kid_home AS number_of_kids, teen_home AS number_of_teens,
	'Chocolate' Product,
	SUM(amt_chocolates) AS total_spent
FROM public.marketing_data
	GROUP BY kid_home, teen_home
UNION ALL
SELECT kid_home AS number_of_kids, teen_home AS number_of_teens,
	'Commodities' Product,
	SUM(amt_comm) AS total_spent
FROM public.marketing_data
	GROUP BY kid_home, teen_home
	ORDER BY total_spent DESC;
	
SELECT * FROM most_popular_products_kids_teens_v;

/* ADDING COLUMN OF TOTAL CHILDREN TO TABLE */

ALTER TABLE marketing_data
ADD total_number_of_chidren INTEGER;

ALTER TABLE marketing_data
DROP COLUMN total_number_of_chidren;



/* JOINING AD DATA */

SELECT
marketing_data.id,
marketing_data.marital_status,
marketing_data.kid_home,
marketing_data.teen_home,
ad_data.bulkmail_ad,
ad_data.twitter_ad,
ad_data.instagram_ad,
ad_data.facebook_ad,
ad_data.brochure_ad
FROM marketing_data
	JOIN ad_data ON ad_data.id = marketing_data.id;
	

SELECT country,
	COUNT(*) AS total_records,
	SUM(kid_home) AS kids_at_home,
	SUM(teen_home) AS teens_at_home,
	SUM(amt_liq) + SUM(amt_veg) + SUM(amt_non_veg) + SUM(amt_pes) + SUM(amt_chocolates) + SUM(amt_comm) AS total_spent,
	SUM(bulkmail_ad) AS total_bulkmail_ad,
	SUM(twitter_ad) AS total_twitter_ad,
	SUM(instagram_ad) AS total_instagram_ad,
	SUM(facebook_ad) AS total_facebook_ad,
	SUM(brochure_ad) AS total_brochure_ad
FROM (
SELECT
	marketing_data.id,
	marketing_data.country,
	marketing_data.kid_home,
	marketing_data.teen_home,
	marketing_data.amt_liq,
	marketing_data.amt_veg,
	marketing_data.amt_non_veg,
	marketing_data.amt_pes,
	marketing_data.amt_chocolates,
	marketing_data.amt_comm,
	ad_data.bulkmail_ad,
	ad_data.twitter_ad,
	ad_data.instagram_ad,
	ad_data.facebook_ad,
	ad_data.brochure_ad
FROM marketing_data
	JOIN ad_data ON ad_data.id = marketing_data.id) detail
GROUP BY country
ORDER BY total_spent DESC;



SELECT country,
	COUNT(*) AS total_records,
	SUM(kid_home) + SUM(teen_home) AS total_kids_and_teens_at_home,
	SUM(amt_liq) + SUM(amt_veg) + SUM(amt_non_veg) + SUM(amt_pes) + SUM(amt_chocolates) + SUM(amt_comm) AS total_spent,
	SUM(bulkmail_ad) AS total_bulkmail_ad,
	SUM(twitter_ad) AS total_twitter_ad,
	SUM(instagram_ad) AS total_instagram_ad,
	SUM(facebook_ad) AS total_facebook_ad,
	SUM(brochure_ad) AS total_brochure_ad
FROM (
SELECT
	marketing_data.id,
	marketing_data.country,
	marketing_data.kid_home,
	marketing_data.teen_home,
	marketing_data.amt_liq,
	marketing_data.amt_veg,
	marketing_data.amt_non_veg,
	marketing_data.amt_pes,
	marketing_data.amt_chocolates,
	marketing_data.amt_comm,
	ad_data.bulkmail_ad,
	ad_data.twitter_ad,
	ad_data.instagram_ad,
	ad_data.facebook_ad,
	ad_data.brochure_ad
FROM marketing_data
	JOIN ad_data ON ad_data.id = marketing_data.id) detail
GROUP BY country
ORDER BY total_spent DESC;