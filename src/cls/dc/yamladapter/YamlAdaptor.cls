Class dc.yamladapter.YamlAdaptor Extends (%DynamicAbstractObject, %JSON.Adaptor)
{

ClassMethod CreateFromFile(yamlFile As %String) As %DynamicObject
{
    Try {
		Set sc=$$$OK
		Set jsonFile = "/tmp/"_##class(%SYSTEM.Util).CreateGUID()_".json"
		Set jsonStream = ##class(%Stream.FileCharacter).%New()
        Do ##class(dc.yamladapter.YamlUtil).yamlFileToJsonFile(yamlFile, jsonFile)
		Set sc = jsonStream.LinkToFile(jsonFile)
		Set jsonResult = {}.%FromJSON(jsonStream)
		Set sc = ##class(%Library.File).Delete(jsonFile, .outputArgument)
		Return jsonResult
	} Catch ex {
		Return {}
	}
}

ClassMethod CreateYamlFromDynamicObject(dynaObj As %DynamicObject) As %String
{
    Try {
		Set jsonContent = dynaObj.%ToJSON()
		Do ##class(dc.yamladapter.YamlUtil).jsonToYaml(jsonContent, .yamlContent)
		Return yamlContent
	} Catch ex {
		Return ""
	}
}

ClassMethod YamlImport(yamlContent As %String = "") As %Status
{
	Try {
		Set sc=$$$OK
		
        Set jsonContent = ##class(dc.yamladapter.YamlUtil).yamlToJson(yamlContent)
        Do ..%JSONImport(jsonContent)
		
	} Catch ex {
		Set sc=ex.AsStatus()
	}

	Quit sc
}

ClassMethod YamlExport(Output yamlContent As %String) As %Status
{
	Try {
		Set sc=$$$OK
		Do ..%JSONExportToString(.jsonContent)
        Set yamlContent = ##class(dc.yamladapter.YamlUtil).jsonToYaml(jsonContent)
	} Catch ex {
		Set sc=ex.AsStatus()
	}

	Quit sc
}

}
