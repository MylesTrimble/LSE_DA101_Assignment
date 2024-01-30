DROP TABLE public.marketing_data;

CREATE TABLE public.marketing_data(
	id BIGINT PRIMARY KEY,
	year_birth INTEGER,
	age_in_2022 INTEGER,
	education VARCHAR(50),
	marital_status VARCHAR(50),
	income MONEY,
	kid_home INTEGER,
	teen_home INTEGER,
	dt_customer DATE,
	recency INTEGER,
	amt_liq MONEY,
	amt_veg MONEY,
	amt_non_veg MONEY,
	amt_pes MONEY,
	amt_chocolates MONEY,
	amt_comm MONEY,
	num_deals INTEGER,
	num_web_buy INTEGER,
	num_walk_in_pur INTEGER,
	num_visits INTEGER,
	response INTEGER,
	complain INTEGER,
	country VARCHAR(50),
	count_success INTEGER);
	
SELECT * FROM public.marketing_data;