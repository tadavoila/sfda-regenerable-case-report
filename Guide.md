# San Francisco Supervisor District Crime Statistics Generator
A regenerable report on crime in San Francisco police and supervisor districts designed by Siddharth Chattoraj

### Installation Requirements
1. Install Visual Studio Code and open these files.
2. Install the Live Server extension and any other debugging extensions needed.
2. Install RStudio to update crime data.

### How to Update Supervisor District Variables/Run
1. Fill in the variables in the first cell of ``sup.ipynb`` with the appropriate values.
2. Run ``sup.ipynb`` by clicking "Run All" at the top.
3. Run ``Supervisor District Report.html`` by clicking "Go Live" in the bottom right. Ihe HTML document that appears may look weird, but that is ok.
4. Ctrl + P on the document save it as a pdf. For best quality and to avoid pop-ups, stay still on the page for a second, and keep your mouse on the scroll bar.
5. If you would like to make any more changes, press the circle with a slash in the bottom right of Visual Studio Code. Click "Go Live" once the new changes are added.

### How to Update Police District District Variables/Run
1. Fill in the variables in the first cell of ``police.ipynb`` with the appropriate values.
2. Run ``police.ipynb`` by clicking "Run All" at the top.
3. Run ``Police District Report.html`` by clicking "Go Live" in the bottom right. Ihe HTML document that appears may look weird, but that is ok.
4. Ctrl + P on the document save it as a pdf. For best quality and to avoid pop-ups, stay still on the page for a second, and keep your mouse on the scroll bar.
5. If you would like to make any more changes, press the circle with a slash in the bottom right of Visual Studio Code. Click "Go Live" once the new changes are added.

### How to Update Crime Data
1. Add your data to the "Data" folder. Make sure it is named the exact same as the file you are replacing.
2. Run ``Incident_Geometries.R``.
3. Run ``Rebooking_Incidents.R``.

### How to Update Shapefile/Geometrical Data
1. Visit the [San Francisco Open Data Portal](https://datasf.org/opendata/), and find the new data.
2. Download as a **shapefile**.
3. Save all 4 filed — unzipped — to the Neighborhoods, Police Districts, Supervisor Districts, or Zip Codes files in the Data folder using the exact same name.

### Troubleshooting
1. Due to the high frequency of convictions, diversions, other actions, and dismissals in the disposition dataset, the code used to create the disposition plots and tables on the second page assumes that all 4 of those disposition types exist in the dataset. Since there is a low frequency of acquittals, the report is built to account for situations where there are no acquittals. If a ``KeyError`` occurs because one or more of convictions, diversions, other actions, or dimissals are missing in the dataset, please follow the Try-Except block examples in all 3 charts under the "Disposition Plots" section of the ``sup.ipynb`` and ``police.ipynb`` and write one for the missing disposition type.
2. If the values in the Crime Type column of the crime plot or the disposition plot take up multiple lines, thus distorting the table, follow the ``.str.replace`` examples already done for certain crimes in the .ipynb code.
3. If you would like to edit the summary, you can edit it at the bottom of an .ipynb file. You must maintain or go above the character limit in the template, since that is the minimum needed to keep the format. 
4. If a header and footer appear on the report in small text a the very top and bottom when you try to print it, you can turn it off by clicking Ctrl + P (or equivalent) and then, in the "More Settings" section, navigate to the "Options" section. Then, uncheck "Headers and Footers". After you do it once, it should apply for all future prints until you re-check it.
5. If a pop-up picture or block appears on the print preview of the report, cancel the print, move your mouse to the left-most or right-most side, and print again. The reason the pop-ups or blocks appear are since some of the graphs have interactive features.
6. If you need to move some of the graphs around, you need to edit the top part of the corresponding ``Report.html`` file. Find the corresponding CSS class and change the margin value. For the cases filed box, you would need to edit that in its ``<div>`` container.

### Resolving Common Errors
1. If the second page (the top of which is the disposition box and the disposition bar chart) moves too up (into the first page), change the ``#dispo-box`` CSS class in the corresponding ``Report.html`` file by increasing the ``margin-top`` (make the value less negative) to move everything down. If it moves too down (creating an extra space at the top of the second page or 3 pages), change the ``#dispo-box`` CSS class in the corresponding ``Report.html`` file by decreasing the ``margin-top`` (make the value more negative) to move everything up.
2. Double check to make sure that after you "Run All" in the ``.ipynb`` file you are using, everything is updated. If everything is not updated, scroll to the bottom of the file, and then press "Run All" again. 
