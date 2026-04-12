CREATE TABLE IF NOT EXISTS employee (
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	department VARCHAR(80) NOT NULL,
	chief_id INTEGER REFERENCES employee(employee_id)
);