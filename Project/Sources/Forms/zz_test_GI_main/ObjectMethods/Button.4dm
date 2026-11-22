If (Form.sf=Null)
	Form.sf:=New object
	Form.sf2:=New object
	Form.sf3:=New object
	Form.sf4:=New object
	Form.sf.name:="sf1"
	Form.sf2.name:="sf2"
	Form.sf3.name:="sf3"
	Form.sf4.name:="sf4"
End if 
OBJECT SET SUBFORM(*;"Subform";"zz_test_GI")
OBJECT SET SUBFORM(*;"Subform2";"zz_test_GI")
OBJECT SET SUBFORM(*;"Subform3";"zz_test_GI")
OBJECT SET SUBFORM(*;"Subform4";"zz_test_GI")