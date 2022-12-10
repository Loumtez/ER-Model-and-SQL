	
select  b.model, c.brand, d.company_group, a.purchase_date, a.license,e.color, a.total_km, g.company_insurance, f.insurance_number
from lourdes_martinez.cars a 
	join lourdes_martinez.model b on b.id_model = a.id_model
	join lourdes_martinez.brand c on c.id_brand = b.id_brand
	join lourdes_martinez.company_group d on d.id_company_group = c.id_company_group 
	join lourdes_martinez.color e on e.id_color = a.id_color
	join lourdes_martinez.insurance f on f.id_insurance = a.id_insurance
	join lourdes_martinez.company_insurance g on g.id_company_insurance = f.id_company_insurance;

	
