package yamladaptor;

import java.util.UUID;

import com.intersystems.enslib.pex.BusinessOperation;
import com.intersystems.jdbc.IRISObject;


public class JsonToYamlOperation extends BusinessOperation {

    public String getAdapterType() {
        return "EnsLib.File.OutboundAdapter";
    }
    
    @Override
    public Object OnMessage(Object arg0) throws Exception {
    	
    	Object status = new Object();
    	IRISObject message = (IRISObject) arg0;
    	String jsonContent = "";
        try {
        	IRISObject jsonStream = (IRISObject)message.get("Stream");
        	jsonStream.invoke("Rewind");
        	while (!jsonStream.getBoolean("AtEnd").equals(true)) {
        		jsonContent = jsonContent + jsonStream.invokeString("ReadLine");
        	}
        	
        	YamlUtil yamlUtil = new YamlUtil();
        	String yamlContent = yamlUtil.jsonToYaml(jsonContent);
        	status = Adapter.invoke("PutString", UUID.randomUUID().toString() + ".yaml", yamlContent);
            
        } catch (Exception e) {
        	status = "Error while converting from JSON to YAML: " + e.getMessage();
            throw new Exception("Error while converting from JSON to YAML: " + e.getMessage(), e);
        }

        return status; 
    }

	@Override
	public void OnInit() throws Exception {
		
	}

	@Override
	public void OnTearDown() throws Exception {
		
	}

}