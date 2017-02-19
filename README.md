# gov-data
A collection of IPython notebooks for scraping and cleaning publically available U.S. government data

### Campaign Finance (govdata-CampaignFinance.ipynb)

This notebook provides an IPython-based workflow for downloading publically-avaialble U.S. Federal Election Commission data (1980 - 2016).

The full data dictionary is provided for both base tables and dimension tables - in case it were to ever "disappear".

There is also an example method for loading PostgreSQL for the two largest datasets (operating expenses and individual contributions).

The total data size is 2.9GB.

#### TODO: 
- DDL / table definitions for each dataset
- MD5 checksums for each file
- Additional "interestings"
- Neo4J loading scripts (this will be useful for more easily tracing the flow from committees to candidates)

#### Dependencies:
- cURL
- bsdtar
- gzip
- Pandas (loosely)
- Dask (work in progress)

#### Interestings:
###### Occupations with the highest average contribution amount
(work in progress - needs more intelligence in Occupation text field)
```
select "Occupation", avg("Transaction Amount") 
from individual_contributions 
group by 1 order by 2 desc limit 25;
```
![average-amount-by-occupation-string](https://github.com/kdunn926/gov-data/raw/master/images/highest-average-contributions-by-occupation-naive.png)

###### Employers with the highest average contribution amount
(work in progress - needs more intelligence in Employer text field)
```
select "Employer", avg("Transaction Amount") 
from individual_contributions 
group by 1 order by 2 desc limit 25;
```
![average-amount-by-employer-string](https://github.com/kdunn926/gov-data/raw/master/images/highest-average-contributions-by-employer-naive.png)

### Congressional Record (govdata-congressionalRecord*)

These notebooks provide a workflow for download and parsing the HTML version of the publically-available U.S. Congressional Publishing Office's Congressional Record, available in this format dating back to 1994 - the 103rd Congress. 


#### [Scraper](https://github.com/kdunn926/gov-data/blob/master/govdata-congressionalRecordScraper.ipynb)
This notebook provides a workflow for downloading the entire U.S. Congressional Record in either HTML or PDF format, conviently made publically available by the Government Publishing Office's FDsys portal.

The process is as follows:
1. Define some years, months, and days of interest
2. "Click" through the tables found here to expand a given year, month, and day: https://www.gpo.gov/fdsys/browse/collection.action?collectionCode=CREC
3. Extract all "source data links" from the inner most HTML table - both HTML and PDF format - into a list
4. Download each of the files from that list (I use HTML for ease of parsing)
5. Merge multi-file sessions into a single text file -  House and Senate sessions are commonly broken into multiple HTML pages (for "ease" of reading, or potentially, "difficulty" of scraping)
6. Another notebook in this repo is available for parsing these plain text files into interesting features - monologues, inter-monologue [name] references, proper nouns, etc.
7. Another set of scripts in this repo will load outputs from step 6. into a Neo4J database 

##### Note: this process is constrained mostly by the sheer number of web requests to download the whole corpus. I don't have specific timing captured but as I recall it was on the order of 24 hours on a 40Mbit connection and 4 threads.

#### [Parser](https://github.com/kdunn926/gov-data/blob/master/govdata-congressionalRecordParser.ipynb)
This notebook takes U.S. Congressional Record session text files created from [here](https://github.com/kdunn926/gov-data/blob/master/govdata-congressionalRecordScraper.ipynb) and splits it apart into distinct monolgoes, capitalizing off of the semi-structures format of `Mr. NOBODY: <monologe text>` consistent throughout the GPO's Congressional Record archive.

Additionally, it attempts to identify and extract:
- session times (start and/or end - work in progess)
- mentions within a monologue of other people and proper nouns, both implemented using some hairy regexp
- "context" of a monologue - each monologue is assigned a unique, sequential id, to facilitate contextual forward/backward exploration of the session when starting from a single monologue

We also "join" in Congressional "roster" data, scraped (and manually cleaned) from Wikipedia - to allow annotating: 
- party affiliations
- state represented
- "role" in the Congress (whip, speaker, etc.)
- term end

The output of this notebook is compressed, delimited text files, intended to be loaded in something like Neo4J, or even a SQL database. Neo4J _should_ allow for intuitive queries based on the highly connection nature of this dataset.

##### Note: this process is rather compute-intensive. It's probably very poorly optimized... some attempt has been made to help this but PRs are always welcome!

End to end timing for data from ~1992 to mid-2016 was **9 hours**

2012 Macbook, 2.3 GHz Intel Core i7, 8GB 1600 MHz DDR3, no SSD
