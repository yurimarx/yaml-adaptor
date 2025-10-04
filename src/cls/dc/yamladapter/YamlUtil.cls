Class dc.yamladapter.YamlUtil Extends %RegisteredObject
{

ClassMethod jsonToYaml(jsonContent As %String, Output yamlContent As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil") 
        
        set yamlContent = yamlUtil.jsonToYaml(jsonContent)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

ClassMethod jsonFileToYamlFile(jsonFile As %String, Output yamlFile As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil") 
        Do yamlUtil.jsonFileToYamlFile(jsonFile, yamlFile)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

ClassMethod yamlToJson(yamlContent As %String, Output jsonContent As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil") 
        set jsonContent = yamlUtil.yamlToJson(yamlContent)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

ClassMethod yamlFileToJsonFile(yamlFile As %String, Output jsonFile As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil")         
        Do yamlUtil.yamlFileToJsonFile(yamlFile, jsonFile)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

ClassMethod xmlToYaml(xmlContent As %String, Output yamlContent As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil") 
        
        set yamlContent = yamlUtil.xmlToYaml(xmlContent)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

ClassMethod yamlToXml(yamlContent As %String, Output xmlContent As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil") 
        set xmlContent = yamlUtil.yamlToXml(yamlContent)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

ClassMethod xmlFileToYamlFile(xmlFile As %String, Output yamlFile As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil") 
        Do yamlUtil.xmlFileToYamlFile(xmlFile, yamlFile)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

ClassMethod yamlFileToXmlFile(yamlFile As %String, rootName As %String, Output xmlFile As %String) As %Status
{
    Set tSC = $$$OK

    Try {
        
        set javaGate = $system.external.getJavaGateway()  
        do javaGate.addToPath($SYSTEM.Util.BinaryDirectory()_"yaml-adaptor.jar")
        set yamlUtil = javaGate.new("yamladaptor.YamlUtil")         
        Do yamlUtil.yamlFileToXmlFile(yamlFile, xmlFile, rootName)
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    return tSC
}

}
