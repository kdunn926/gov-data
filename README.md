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
![First go at finding the occupations with highest average campaign contributions](https://github.com/kdunn926/gov-data/raw/master/highest-average-contributions-by-occupation-naive.png)

