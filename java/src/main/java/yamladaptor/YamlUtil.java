package yamladaptor;

import java.io.File;
import java.util.Map;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLMapper;

public class YamlUtil {

    private static final ObjectMapper jsonMapper = new ObjectMapper();
    private static final YAMLMapper yamlMapper = new YAMLMapper();
    private static final ObjectMapper xmlMapper = new XmlMapper();
    
    public String jsonToYaml(String jsonString) throws Exception {
        JsonNode jsonNode = jsonMapper.readTree(jsonString);
        yamlMapper.enable(SerializationFeature.INDENT_OUTPUT);
        return yamlMapper.writeValueAsString(jsonNode);
    }
    
    public void jsonFileToYamlFile(String jsonFile, String yamlFile) throws Exception {
        JsonNode jsonNode = jsonMapper.readTree(new File(jsonFile));
        yamlMapper.enable(SerializationFeature.INDENT_OUTPUT);
        yamlMapper.writerWithDefaultPrettyPrinter().writeValue(new File(yamlFile), jsonNode);
    }

    public String yamlToJson(String yamlString) throws Exception {
        JsonNode jsonNode = yamlMapper.readTree(yamlString);
        jsonMapper.enable(SerializationFeature.INDENT_OUTPUT);
        return jsonMapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonNode);
    }
    
    public String xmlToJson(String xmlString) throws Exception {
    	XmlMapper xmlMapper = new XmlMapper();
    	xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
    	JsonNode jsonNode = xmlMapper.readTree(xmlString);
        return jsonMapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonNode);
    }
    
    public void xmlFileToJsonFile(String xmlFile, String jsonFile) throws Exception {
    	XmlMapper xmlMapper = new XmlMapper();
    	xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
    	JsonNode jsonNode = xmlMapper.readTree(new File(xmlFile));
        jsonMapper.writerWithDefaultPrettyPrinter().writeValue(new File(jsonFile), jsonNode);
    }
    
    public String jsonToXml(String jsonString) throws Exception {
    	JsonMapper jsonMapper = new JsonMapper();
    	Object jsonNode = jsonMapper.readValue(jsonString, Object.class);
    	xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
    	return xmlMapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonNode);
    }
    
    public void jsonFileToXmlFile(String jsonFile, String xmlFile) throws Exception {
    	JsonMapper jsonMapper = new JsonMapper();
    	Object jsonNode = jsonMapper.readValue(new File(jsonFile), Object.class);
    	xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
    	xmlMapper.writerWithDefaultPrettyPrinter().writeValue(new File(xmlFile), jsonNode);
    }
    
    public void yamlFileToJsonFile(String yamlFile, String jsonFile) throws Exception {
        JsonNode jsonNode = yamlMapper.readTree(new File(yamlFile));
        jsonMapper.enable(SerializationFeature.INDENT_OUTPUT);
        jsonMapper.writerWithDefaultPrettyPrinter().writeValue(new File(jsonFile), jsonNode);
    }
    
    public String yamlToXml(String yamlString, String rootName) throws Exception {
        @SuppressWarnings("unchecked")
		Map<String, Object> dataMap = yamlMapper.readValue(yamlString, Map.class);
        yamlMapper.enable(SerializationFeature.INDENT_OUTPUT);
        return xmlMapper.writer().withRootName(rootName).writeValueAsString(dataMap);
    }
    
    public void yamlFileToXmlFile(String yamlFile, String xmlFile, String rootName) throws Exception {
        @SuppressWarnings("unchecked")
		Map<String, Object> dataMap = yamlMapper.readValue(new File(yamlFile), Map.class);
        xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
        xmlMapper.writer().withRootName(rootName).writeValue(new File(xmlFile), dataMap);
    }
    
    public String xmlToYaml(String xmlString) throws Exception {
        @SuppressWarnings("unchecked")
		Map<String, Object> dataMap = xmlMapper.readValue(xmlString, Map.class);
        xmlMapper.enable(SerializationFeature.INDENT_OUTPUT); 
        return yamlMapper.writeValueAsString(dataMap);
    }
    
    public void xmlFileToYamlFile(String xmlFile, String yamlFile) throws Exception {
        @SuppressWarnings("unchecked")
		Map<String, Object> dataMap = xmlMapper.readValue(new File(xmlFile), Map.class);
        yamlMapper.enable(SerializationFeature.INDENT_OUTPUT); 
        yamlMapper.writer().writeValue(new File(yamlFile), dataMap);
    }
    
}