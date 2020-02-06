If (Form:C1466.sf=Null:C1517)
	Form:C1466.sf:=New object:C1471
	Form:C1466.sf2:=New object:C1471
	Form:C1466.sf3:=New object:C1471
	Form:C1466.sf4:=New object:C1471
	Form:C1466.sf.name:="sf1"
	Form:C1466.sf2.name:="sf2"
	Form:C1466.sf3.name:="sf3"
	Form:C1466.sf4.name:="sf4"
End if 
OBJECT SET SUBFORM:C1138(*;"Subform";"zz_test_GI")
OBJECT SET SUBFORM:C1138(*;"Subform2";"zz_test_GI")
OBJECT SET SUBFORM:C1138(*;"Subform3";"zz_test_GI")
OBJECT SET SUBFORM:C1138(*;"Subform4";"zz_test_GI")