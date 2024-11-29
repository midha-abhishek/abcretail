# abcretail

## A Data Lake House Project

## Technologies Involved

- **GitHub** for:
	- *`Continuous-Integration/Continuous-Deployment (CI/CD)`*
	- **HTTP API** Replication
	- Important Project Documents
- **Microsoft Entra ID** with:
	- **Azure Default Directory** application for *`Service Principal`*
- **Azure Key Vault** for:
	- *`Service Principal`*
	- Storing other secrets, passwords and credentials
- **Azure SQL Database** with **Azure SQL Server**
- **Microsoft SQL Server** with:
	- **Microsoft SQL Server Management Studio**
	- **Microsoft SQL Server Configuration Manager**
	- **ANSI SQL**
	- **DBeaver** for the *`ER Diagram`*
	- **Microsoft Integration Runtime**
- **Azure Data Lake Gen2 Storage Account**
- **Azure Data Factory**
- **Azure Databricks** with
	- **PySpark**
	- **Delta Tables**
- **Azure Synapse Analytics** with
	- *`Serverless Database Pool`*
	- **Transact-SQL**

## Abstract

This project uses ***GitHub*** for *`Continuous-Integration/Continuous-Deployment (CI/CD)`* throughout its course.

*`Dynamic`* links, triggers, datasets, data flows and other pipeline activities were used wherever permissible to avoid hard-coding. They were *`tested`* thoroughly with the required credentials.

For security, *`Service Principal`* was used with the combination of ***Microsoft Entra ID*** with ***Azure Default Directry App*** and ***Azure Key Vault*** was used. ***Azure Key Vault*** was also used to store other important secrets, passwords and credentials.

The project involves data ingestion from multiple sources:

- ***HTTP API*** with JSON softline products data
- ***Azure SQL Database***
- On-Premise ***Microsoft SQL Server***

> [!note]- GitHub HTTP API Replication
> 
> To replicate the HTTP API, I created and uploaded the JSON documents to the GitHub, which could be found [here](https://github.com/midha-abhishek/abcretail/tree/main/softline_data). I used their direct raw HTTP links to pull data.
> 
> The includes links to the following JSON files are here:
> 
> - [accessories.json](https://raw.githubusercontent.com/midha-abhishek/abcretail/refs/heads/main/softline_data/accessories.json)
> - [clothing.json](https://raw.githubusercontent.com/midha-abhishek/abcretail/refs/heads/main/softline_data/clothing.json)
> - [footwear.json](https://raw.githubusercontent.com/midha-abhishek/abcretail/refs/heads/main/softline_data/footwear.json)
> - [home_decor.json](https://raw.githubusercontent.com/midha-abhishek/abcretail/refs/heads/main/softline_data/home_decor.json)

The *`raw`* data from the various sources is then stored onto the "raw" container of the ***Azure Data Lake Storage Gen2 Account*** using ***Azure Data Factory*** pipeline.

**`Lookup`**, **`Foreach`** and **`Swith`** activities are used to automate the dynamic pipeline for each dataset and data source.

The JSON raw data are stored first as it is using the **`Copy data`** activity, and then as CSV using the `Data flow` to ensure that the nested objects and arrays are saved properly under their respective CSV headers.

**`Copy data`** activity is also used for the raw data ingestion from the **Azure SQL Database*** and ***Microsoft SQL Server***.

Using *`PySpark`* in an ***Azure Databricks*** cluster, the raw data is then cleaned and stored in *`Delta Tables`* onto the "curated" container of the Storage Account

With another **Databricks** cluster, the Delta Tables are transformed to 
