
Case of 
	: (Form event code=On Load)
		OBJECT Get pointer(Object named;"title")->:="New event"
		OBJECT Get pointer(Object named;"place")->:="Enter a place"
		OBJECT Get pointer(Object named;"notes")->:="Notes"
		
		
		OBJECT Get pointer(Object named;"startDate")->:=Current date
		OBJECT Get pointer(Object named;"endDate")->:=Current date
		OBJECT Get pointer(Object named;"startHour")->:=Current time
		OBJECT Get pointer(Object named;"endHour")->:=Current time+3600
		
		GOTO OBJECT(*;"")
		
End case 
