select c.car_id, c.registration_date, c.plate_number, c.kms, m.name as model, b.name as brand, g.name as "group", c2."name" as color, i.policy_number, ic."name" as insurance_co 
from practica_olivia_gonzalez.cars c , practica_olivia_gonzalez.models m , practica_olivia_gonzalez.brands b , 
practica_olivia_gonzalez.groups_ g , practica_olivia_gonzalez.colors c2 , practica_olivia_gonzalez.insurance i , 
practica_olivia_gonzalez.insurance_companies ic
where c.model_id = m.model_id and m.brand_id = b.brand_id and b.group_id = g.group_id and c.color_id = c2.color_id and c.car_id = i.car_id and i.insurance_comp_id = ic.insurance_comp_id and c.status = 1 
