# San Francisco District Attorney's Office Regenerable Case Report
Regenerable police district and supervisor district case information and disposition reports based on a given district and timeframe to be distributed to San Francisco community members

Final Report Examples:
- ``Police District Report Ex.pdf``: Example 2022-2023 Police District Report
- ``Supervisor District Report Ex.pdf``: Example 2023 Supervisor District Report

Usage Guide:
- ``Guide.md``: Guide on how to run the files in the repository and how to troubleshoot errors

Material Folders:
- ``Data``: Original case location, case information, and case disposition data files and shapefiles for neighborhoods, police districts, supervisor districts, and zip codes
- ``Outputs``: Output files from geospatial data analysis R scripts

Geospatial Data Analysis Scripts:
- ``Incident_Geometries.R``: Script to map police incidents to zip codes, supervisor districts, neighborhoods, and police districts via spatial joins 
- ``Rebooking_Incidents.R``: Script to merge case location data with case information data

Chart Generators:
- ``police.ipynb``: Creates heatmaps, tables, pie charts, box graphics, bar charts, and location maps via Python Plotly for a given police district and timeframe
- ``sup.ipynb``: Creates heatmaps, tables, pie charts, box graphics, bar charts, and location maps via Python Plotly for a given supervisor district and timeframe

JSON File Folders:
- ``Police JSON``: Stores police district charts as JSON files
- ``Sup JSON``: Stores supervisor district charts as JSON files

Report Generators:
- ``Police District Report.html``: Generates police district report via HTML and JavaScript
- ``Supervisor District Report.html``: Generates supervisor district report via HTML and JavaScript
