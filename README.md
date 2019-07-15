## JPACRUDProject - National Park Animals

<img src="NatlPark Tables.png" />

This is a basic CRUD project, giving a user the ability to View, Add, Update, and Remove animals, wild flowers, and sightings of either animals or wildflowers within the park.

### File Structure
This project is three parts: JPA, Spring Boot MVC, and a database. The JPA contains the Animal as well as the connection to the database in the Persistence.xml file. The Spring boot section contains the application driving the app, the controller for routing, JSPs for the view, and the DAO/DAOImpl to perform the CRUD opeations in the DB. The DataBase was constructed in MySQL Workbench and contains several tables shown above.

#### Technologies
- Java
- Spring Boot MVC
- Git
- Github
- MySQL
- MySQL Work Bench
- AWS
- JSP
- HTML
- CSS
- Gradle

#### Lessons Learned
- Be careful in config stages
- Commit early and often
- Using Git is a lot like being SpiderMan: With Great power comes great responsibility
- Spring can't pass Dates as dates by default so you have to convert the String of the date from the request object back into a date before using it
