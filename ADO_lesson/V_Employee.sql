CREATE VIEW [dbo].[V_Employee]
	AS SELECT E.LastName ,
	E.FirstName, 
	E.BirthDate ,
	EM.LastName as 'RespLastName' , 
	EM.FirstName as 'RespFirstName' , 
	E.Email,EM.Email as 'RespEmail' 


	FROM Employee E join Employee EM on E.ResponsableID = EM.Id
