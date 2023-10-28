CREATE TABLE IF NOT EXISTS  providers(
	provider_code SERIAL PRIMARY KEY,
	name VARCHAR (45) NOT NULL,
	address VARCHAR (25) NOT NULL,
	city VARCHAR (40) NOT NULL,
	province VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS categories (
	category_code SERIAL PRIMARY KEY,
	name VARCHAR (40) NOT NULL
);

CREATE TABLE IF NOT EXISTS parts (
	part_code SERIAL PRIMARY KEY,
	name VARCHAR (25) NOT NULL,
	color VARCHAR (20) NOT NULL,
	price NUMERIC (10,2) NOT NULL,
	category_code INT NOT NULL,
	
	FOREIGN KEY (category_code)
	REFERENCES categories(category_code)
);

CREATE TABLE IF NOT EXISTS purcharse_order (
	order_code SERIAL PRIMARY KEY,
	amount INT NOT NULL,
	date DATE NOT NULL,
	time TIME WITH TIME ZONE NOT NULL,
	
	provider_code INT NOT NULL,
	part_code INT NOT NULL,
	
	FOREIGN KEY (provider_code)
	REFERENCES providers(provider_code),
	
	FOREIGN KEY (part_code)
	REFERENCES parts(part_code)
);