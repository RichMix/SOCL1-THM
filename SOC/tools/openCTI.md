# OpenCTI
OpenCTI is another open-sourced platform designed to provide organisations with the means to manage CTI through the storage, analysis, visualisation and presentation of threat campaigns, malware and IOCs.
[OpenCTI](https://docs.opencti.io/latest/deployment/overview/)

### Objective
Developed by the collaboration of the French National cybersecurity agency (ANSSI), the platform's main objective is to create a comprehensive tool that allows users to capitalise on technical and non-technical information while developing relationships between each piece of information and its primary source. 
The platform can use the MITRE ATT&CK framework to structure the data. Additionally, it can be integrated with other threat intel tools such as MISP and TheHive. 
Rooms to these tools have been linked in the overview.

## OpenCTI Data Model
OpenCTI uses a variety of knowledge schemas in structuring data, the main one being the Structured Threat Information Expression (STIX2) standards. STIX is a serialised and standardised language format used in threat intelligence exchange. It allows for the data to be implemented as entities and relationships, effectively tracing the origin of the provided information.

This data model is supported by how the platform's architecture has been laid out. The image below gives an architectural structure for your know-how.

### OpenCTI Architecture

Source: OpenCTI Public Knowledge Base

The highlight services include:

- GraphQL API: The API connects clients to the database and the messaging system.
- Write workers: Python processes utilised to write queries asynchronously from the RabbitMQ messaging system.
- Connectors: Another set of Python processes used to ingest, enrich or export data on the platform. These connectors provide the application with a robust network of integrated systems and frameworks to create threat intelligence relations and allow users to improve their defence tactics.

### According to OpenCTI, connectors fall under the following classes:

| Class |	Description| Examples |
|-------|------------|----------|
| External Input Connector |	Ingests information from external sources |	CVE, MISP, TheHive, MITRE |
| Stream Connector |	Consumes platform data stream	| History, Tanium |
| Internal Enrichment Connector |	Takes in new OpenCTI entities from user requests |	Observables enrichment |
| Internal Import File Connector |	Extracts information from uploaded reports |	PDFs, STIX2 Import |
| Internal Export File Connector |	Exports information from OpenCTI into different file formats |	CSV, STIX2 export, PDF |

Refer to the [connectors](https://docs.opencti.io/latest/deployment/connectors/) and [data model](https://docs.opencti.io/latest/deployment/overview/) documentation for more details on configuring connectors and the data schema.

 

