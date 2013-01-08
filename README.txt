Required software to run the project:

Netbeans IDE with Glassfish server

 

Instructions:

1)Open Netbeans

2)Select Open project from file menu and open the project files available in "chakri1" folder.

3)Now copy the database folder downloaded and paste it in 'C Drive -> User -> .netbeans.derby'(make sure that the database folder 'chakri1-database' is renamed as 'chakri1')

4)In netbeans,rightclick on 'chakri1' under projects and click 'resolve data source'

5)Click 'add connection' and then 'test connection'.Click finish

6)Run the project

 

Project:

a)Click Login

b)Give the rating of the three computers provided on a scale of 1-5.Select the processor speed.

c)Hit get recommendations.

 

Result:

The result page will return the user with three other recommended computers that the user haven't rated.This result is provided using the SlopeOne algorithm on other users ratings and previous ratings of current user.