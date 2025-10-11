 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/yaml-adaptor)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fyaml-adaptor&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fyaml-adaptor)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fyaml-adaptor&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fyaml-adaptor)
# yaml-adaptor
This is utility to process and convert YAML to JSON and Dyanmic Objects and JSON and Dynamic Objects to YAML. It is possible convert XML - YAML and YAML XML also.

## Installation: ZPM

Open IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
USER>zpm "install yaml-adaptor"

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/yaml-adaptor.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## Features

1. Convert from YAML string to JSON string
2. Generate YAML file from a JSON file
3. Convert from JSON string to YAML string
4. Generate JSON file from YAML file
5. Load a dynamic object from YAML string or YAML files
6. Generate YAML from Dynamic Objects
7. Convert from YAML string to XML string
8. Generate XML file from YAML file
9. Generate YAML file from XML File
10. Generate JSON File from XML File (new)
11. Generate XML File from JSON File (new)
12. Convert JSON to XML and XML to JSON (new)
13. Interoperability PEX Business Operation (using File Adapter) to Receive JSON and save as YAML

## How to Run the Sample

Debug or run the class dc.yamladapter.Test to see some examples and results. For file operations pay attention to inputs and outputs on samples folder (docker) and /tmp/samples (IPM)

## How to Run the Interoperability Business Operation
1. Go to Interoperability > Configure > Production EXtensions Components
2. Click the button Register New Component and Fill with these values:
2.1. Remote Classname: yamladaptor.JsonToYamlOperation
2.2. Proxy Name: yamladaptor.JsonToYamlOperation
2.3. External Language Server: %Java Server
2.4. Gateway Extra CLASSPATHS: /usr/irissys/bin/yaml-adaptor.jar 
3. Go to Interoperability > Configure > Production > Click Open and Select dc > yamladapter > YamlProduction
4. Start the production
5. Put files /tmp/samples and the output on /tmp folder