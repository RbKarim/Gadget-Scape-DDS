CREATE OR REPLACE FUNCTION TotalCustomerinSite1
	
return number
is
	m1 NUMBER;
 	total number;
BEGIN

	select count(*) into m1 from customer1;

    total := m1;
 
	
    return total;


END TotalCustomerinSite1;

/