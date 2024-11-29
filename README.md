# abcretail

## A Data Lake House Project

## Abstract

This project uses ***GitHub*** for *`Continuous-Integration/Continuous-Deployment (CI/CD)`* throughout its course.

*`Dynamic`* links, triggers, datasets, data flows and other pipeline activities were used wherever permissible to avoid hard-coding. They were *`tested`* thoroughly with the required credentials.

For security, *`Service Principal`* was used with the combination of ***Microsoft Entra ID*** with ***Azure Default Directry App*** and ***Azure Key Vault*** was used.

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

