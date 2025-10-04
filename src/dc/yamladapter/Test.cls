Class dc.yamladapter.Test
{

ClassMethod TestYamlToJson() As %Status
{
    Set sc = $$$OK
    
    set yamlContent = ""_$CHAR(10)_
        "user:"_$CHAR(10)_
        "    name: 'Jane Doe'"_$CHAR(10)_
        "    age: 30"_$CHAR(10)_
        "    roles:"_$CHAR(10)_
        "    - 'admin'"_$CHAR(10)_
        "    - 'editor'"_$CHAR(10)_
        "database:"_$CHAR(10)_
        "    host: 'localhost'"_$CHAR(10)_
        "    port: 5432"_$CHAR(10)_
        ""

    Do ##class(dc.yamladapter.YamlUtil).yamlToJson(yamlContent, .jsonContent)
    Set jsonObj = {}.%FromJSON(jsonContent)
    Write jsonObj.%ToJSON()

    Return sc
}

ClassMethod TestJsonToYaml() As %Status
{
    Set sc = $$$OK
    
    set jsonContent = "{""user"":{""name"":""Jane Doe"",""age"":30,""roles"":[""admin"",""editor""]},""database"":{""host"":""localhost"",""port"":5432}}"

    Do ##class(dc.yamladapter.YamlUtil).jsonToYaml(jsonContent, .yamlContent)
    Write yamlContent

    Return sc
}

ClassMethod TestJsonFileToYamlFile() As %Status
{

    Set sc = $$$OK

    Set jsonFile = "/tmp/samples/sample.json"
    Set yamlFile = "/tmp/samples/sample_result.yaml"

    Write ##class(dc.yamladapter.YamlUtil).jsonFileToYamlFile(jsonFile, yamlFile)
    

    Return sc
}

ClassMethod TestYamlFileToJsonFile() As %Status
{

    Set sc = $$$OK

    Set yamlFile = "/tmp/samples/sample.yaml"
    Set jsonFile = "/tmp/samples/sample_result.json"

    Write ##class(dc.yamladapter.YamlUtil).yamlFileToJsonFile(yamlFile,jsonFile)
    

    Return sc
}

ClassMethod TestYamlFileToDynamicObject() As %Status
{
    Set sc = $$$OK

    Set yamlFile = "/tmp/samples/sample.yaml"
    
    Set dynamicYaml = ##class(YamlAdaptor).CreateFromFile(yamlFile)

    Write "Title: "_dynamicYaml.title, !
    Write "Version: "_dynamicYaml.version, !

    Return sc
}

ClassMethod TestDynamicObjectToYaml() As %Status
{
    Set sc = $$$OK

    Set dynaObj = {}
    Set dynaObj.project = "Project A"
    Set dynaObj.version = "1.0"
    
    Set yamlContent = ##class(YamlAdaptor).CreateYamlFromDynamicObject(dynaObj)

    Write yamlContent

    Return sc
}

}
