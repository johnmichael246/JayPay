# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Todo.destroy_all
Payperiod.destroy_all
Payroll.destroy_all
Employee.destroy_all






Employee.create([
    {first_name:"John", middle_i:"M", last_name:"Solis", street_address:"22 Faclon Ave", city:"Long Beach",state:"CA", zipcode:"90802", gender:"Male", id_number:"1001", hire_date:"2016-12-30",workers_comp_class:"restaurant", work_location:"Los Angeles", birthday:"10-08-1991", jobtype:"General Manager", rate:21.00, social_security_number:"123121234", federal_filing_status:"single", federal_filing_allowances:"1",state_filing_status:"single", state_filing_allowances:1},
    {first_name:"James", middle_i:"P", last_name:"Hawkins", street_address:"2442 Faclon Ave", city:"Hermosa Beach",state:"CA", zipcode:"90254", gender:"Male", id_number:"1002", hire_date:"2017-12-30",workers_comp_class:"office", work_location:"Los Angeles", birthday:"09-08-1996", jobtype:"Manager", rate:18.00, social_security_number:"123221234", federal_filing_status:"single", federal_filing_allowances:1,state_filing_status:"single", state_filing_allowances:1},
    {first_name:"Jaime", middle_i:"P", last_name:"Guerrero", street_address:"8080 oldway road", city:"Venice",state:"CA", zipcode:"90291", gender:"Male", id_number:"1003", hire_date:"2015-12-30",workers_comp_class:"restaurant", work_location:"Los Angeles", birthday:"01-08-1988", jobtype:"Manager", rate:15.00, social_security_number:"321324321", federal_filing_status:"single", federal_filing_allowances:2,state_filing_status:"single", state_filing_allowances:2},
    {first_name:"Jame", middle_i:"P", last_name:"Hawkins", street_address:"2442 Faclon Ave", city:"Hermosa Beach",state:"CA", zipcode:"90254", gender:"Male", id_number:"1004", hire_date:"2017-12-30",workers_comp_class:"restaurant", work_location:"Los Angeles", birthday:"09-08-1996", jobtype:"Manager", rate:16.00, social_security_number:"246462468", federal_filing_status:"single", federal_filing_allowances:2,state_filing_status:"single", state_filing_allowances:2},
    {first_name:"Suzy", middle_i:"P", last_name:"Smith", street_address:"2442 Faclon Ave", city:"Hermosa Beach",state:"CA", zipcode:"90254", gender:"Female", id_number:"1005", hire_date:"2017-12-30",workers_comp_class:"restaurant", work_location:"Los Angeles", birthday:"09-08-1996", jobtype:"Manager", rate:15.25, social_security_number:"999999999", federal_filing_status:"single", federal_filing_allowances:3,state_filing_status:"single", state_filing_allowances:3},
    {first_name:"Mister", middle_i:"P", last_name:"Anderson", street_address:"8901 Lovely lane", city:"Rendondo Beach",state:"CA", zipcode:"90277", gender:"Male", id_number:"1006", hire_date:"2017-12-30",workers_comp_class:"restaurant", work_location:"Los Angeles", birthday:"09-08-1980", jobtype:"Bartender", rate:18.00, social_security_number:"123191234", federal_filing_status:"single", federal_filing_allowances:2,state_filing_status:"single", state_filing_allowances:2},
    {first_name:"Maximillian", middle_i:"P", last_name:"Poppycock", street_address:"3065 coast circle", city:"Sunset Beach",state:"CA", zipcode:"90742", gender:"Male", id_number:"1007", hire_date:"2016-07-30",workers_comp_class:"restaurant", work_location:"Los Angeles", birthday:"09-08-1995", jobtype:"Bartender", rate:20.00, social_security_number:"123121234", federal_filing_status:"single", federal_filing_allowances:2,state_filing_status:"single", state_filing_allowances:2},
    {first_name:"Kristy", middle_i:"", last_name:"Trenta", street_address:"2442 Faclon Ave", city:"Whittier",state:"CA", zipcode:"90254", gender:"Female", id_number:"1008", hire_date:"2017-12-10",workers_comp_class:"restaurant", work_location:"Los Angeles", birthday:"09-08-1993", jobtype:"Server", rate:12.50, social_security_number:"111223333", federal_filing_status:"married", federal_filing_allowances:2,state_filing_status:"married", state_filing_allowances:2},
 ])