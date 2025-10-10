Class dc.yamladapter.XmlAdaptor Extends (%DynamicAbstractObject, %JSON.Adaptor)
{

ClassMethod CreateFromFile(xmlFile As %String) As %DynamicObject
{
    Try {
		Set sc=$$$OK
		Set jsonFile = "/tmp/"_##class(%SYSTEM.Util).CreateGUID()_".json"
		Set jsonStream = ##class(%Stream.FileCharacter).%New()
        Do ##class(dc.yamladapter.YamlUtil).xmlFileToJsonFile(xmlFile, jsonFile)
		Set sc = jsonStream.LinkToFile(jsonFile)
		Set jsonResult = {}.%FromJSON(jsonStream)
		Set sc = ##class(%Library.File).Delete(jsonFile, .outputArgument)
		Return jsonResult
	} Catch ex {
		Return {}
	}
}

ClassMethod CreateXmlFromDynamicObject(dynaObj As %DynamicObject) As %String
{
    Try {
		Set jsonContent = dynaObj.%ToJSON()
		Do ##class(dc.yamladapter.YamlUtil).jsonToXml(jsonContent, .xmlContent)
		Return xmlContent
	} Catch ex {
		Return ""
	}
}

ClassMethod XmlImport(xmlContent As %String = "") As %Status
{
	Try {
		Set sc=$$$OK
		
        Set jsonContent = ##class(dc.yamladapter.YamlUtil).xmlToJson(xmlContent)
        Do ..%JSONImport(jsonContent)
		
	} Catch ex {
		Set sc=ex.AsStatus()
	}

	Quit sc
}

ClassMethod XmlExport(Output xmlContent As %String) As %Status
{
	Try {
		Set sc=$$$OK
		Do ..%JSONExportToString(.jsonContent)
        Set xmlContent = ##class(dc.yamladapter.YamlUtil).jsonToXml(jsonContent)
	} Catch ex {
		Set sc=ex.AsStatus()
	}

	Quit sc
}

}
