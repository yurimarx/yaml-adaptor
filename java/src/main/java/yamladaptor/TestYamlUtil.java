package yamladaptor;

public class TestYamlUtil {

	public static void main(String[] args) {
        
		YamlUtil util = new YamlUtil();
		
		String jsonExemplo = "{\"nome\":\"Alice\", \"idade\":30, \"hobbies\":[\"leitura\", \"programacao\"], \"endereco\":{\"rua\":\"Rua A\", \"cidade\":\"Cidade B\"}}";
        System.out.println("--- Original JSON ---");
        System.out.println(jsonExemplo);

        try {
            String yamlResultado = util.jsonToYaml(jsonExemplo);
            System.out.println("\n--- YAML converted ---");
            System.out.println(yamlResultado);
        } catch (Exception e) {
            System.err.println("Error for JSON to YAML: " + e.getMessage());
        }

        System.out.println("\n" + "=" + "\n");

        String yamlExemplo = "pessoa:\n"
                           + "  nome: Bob\n"
                           + "  idade: 25\n"
                           + "  linguagens:\n"
                           + "    - Java\n"
                           + "    - Python\n"
                           + "  ativo: true";
        System.out.println("--- Original YAML ---");
        System.out.println(yamlExemplo);

        try {
            String jsonResultado = util.yamlToJson(yamlExemplo);
            System.out.println("\n--- JSON Convertido ---");
            System.out.println(jsonResultado);
        } catch (Exception e) {
            System.err.println("Error while converting from YAML to JSON: " + e.getMessage());
        }
    }
}
