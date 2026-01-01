
install.packages("rvest")
library(rvest)


# URL of the Wikipedia page
url <- "https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)"

# Read the HTML content of the page
page <- read_html(url)

# Extract the first table on the page (the table with country population data)
table <- page %>% html_node("table.wikitable") %>% html_table()

# View the first few rows of the table
head(table)



library(httr)
url <- "https://www.sportskeeda.com/us/olympics/olympic-winners-countries"
web_page <- read_html(url)

olympic_table <- web_page %>%
  html_node("table") %>%
  html_table()

olympic_data <- as_tibble(olympic_table)
head(olympic_data)



library(rvest)
library(dplyr)

# Your starter code
url <- "https://vancouver.craigslist.org/search/apa"
web_page <- read_html(url)
prices <- web_page %>%
  html_nodes(".price") %>%
  html_text()
craigslist_listings <- tibble(
  Price = prices
)
head(craigslist_listings)

# Step 1: Clean the price data
# Remove $ signs and commas, then convert to numbers
craigslist_listings$price_clean <- gsub("\\$|,", "", craigslist_listings$Price)
craigslist_listings$price_number <- as.numeric(craigslist_listings$price_clean)

# Step 2: Remove any rows where price couldn't be converted
clean_listings <- craigslist_listings[!is.na(craigslist_listings$price_number), ]

# Step 3: Look at the cleaned data
print("First few cleaned prices:")
head(clean_listings)

# Step 4: Count houses in different price ranges
below_1000 <- sum(clean_listings$price_number < 1000)
range_1000_1999 <- sum(clean_listings$price_number >= 1000 & clean_listings$price_number < 2000)
range_2000_2999 <- sum(clean_listings$price_number >= 2000 & clean_listings$price_number < 3000)
range_3000_3999 <- sum(clean_listings$price_number >= 3000 & clean_listings$price_number < 4000)
range_4000_4999 <- sum(clean_listings$price_number >= 4000 & clean_listings$price_number < 5000)
above_5000 <- sum(clean_listings$price_number >= 5000)

# Step 5: Create the summary table
price_summary <- data.frame(
  Price_Range = c("Below $1,000", 
                  "$1,000 - $1,999", 
                  "$2,000 - $2,999", 
                  "$3,000 - $3,999", 
                  "$4,000 - $4,999", 
                  "$5,000 and above"),
  Count = c(below_1000, 
            range_1000_1999, 
            range_2000_2999, 
            range_3000_3999, 
            range_4000_4999, 
            above_5000)
)
ggplot(price_summary,aes(x = Price_Range,y = Count)) + geom_line()
plot1 <- ggplot(price_summary, aes(x = Price_Range, y = Count)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  geom_text(aes(label = Count), vjust = -0.5) +
  labs(title = "Number of Rentals by Price Range",
       x = "Price Range",
       y = "Number of Rentals") +
  theme_minimal()

print(plot1)
ggplot(price_summary,aes(x = Price_Range,y = Count)) + geom_point()

ggplot(price_summary, aes(x = Price_Range, y = Count, group = 1)) +
  geom_smooth(color = "darkblue", size = 1.2) +
  geom_point(color = "red", size = 3) +
  geom_text(aes(label = Count), vjust = -0.8) +
  labs(
    title = "Rental Listings Trend Across Price Ranges",
    x = "Price Range",
    y = "Number of Listings"
  ) +
  theme_minimal()

library(ggplot2)

ggplot(price_summary, aes(x = Price_Range, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Rental Listings by Price Range",
       x = "Price Range", y = "Number of Listings") +
  theme_minimal() + theme(axis.text.x = element_text(angle = 45, hjust = 1))

