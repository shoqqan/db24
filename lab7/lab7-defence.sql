CREATE INDEX cats_breed_idx ON cats (breed);

CREATE INDEX owners_firstname_lastname_idx ON owners (first_name, last_name);

CREATE UNIQUE INDEX cats_age_idx ON cats (ages);

CREATE INDEX owners_substring_firstname_idx on owners (SUBSTRING(first_name, 1, 3));

CREATE INDEX cats_age_ownerid_idx on cats (age, owner_id);
CREATE INDEX owners_city_idx on owners (city);