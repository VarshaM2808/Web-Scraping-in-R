# Web Scraping & Exploratory Data Analysis in R (rvest)

End-to-end web scraping + data cleaning + exploratory analysis in **R**.  
This project demonstrates how to collect public web data (when APIs aren’t available), convert HTML into structured tables, clean messy text fields (like prices), and create simple visual insights.

## What this project does
This repo contains examples of scraping and analyzing data from:
- **Wikipedia** (UN population table) → extracting a structured HTML table
- **Craigslist Vancouver** rentals → scraping prices, cleaning them, summarizing by ranges, and plotting
- **Sportskeeda** (Olympic medals table) → extracting a table into a tibble

## Skills shown
- Web scraping with `rvest`
- HTML table & node extraction (`read_html`, `html_node(s)`, `html_table`, `html_text`)
- Data cleaning and transformation (`dplyr`, `gsub`, numeric parsing)
- Exploratory analysis and summaries
- Visualization with `ggplot2`

---

