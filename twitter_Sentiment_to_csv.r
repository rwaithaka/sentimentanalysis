#Change preferences to 64bit directory - Tools - Options C:\ProgramFiles\R\3.1.1

#install and load required packages through the internet
install.packages("twitteR")
install.packages("RCurl")
install.packages("RJSONIO")
install.packages("stringr")
install.packages("base64enc")
install.packages("bit")
install.packages("bit64")

# load package to start using its functions

library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)
library(base64enc)

#if you want to change current working directory wich is by default can be found in  Menu >> Session >> Choose Directory
setwd("d:/Junk") 


#create twitter app using the below link
#https://apps.twitter.com/

# Declare Twitter API Credentials  App#1
api_key <- "" # From dev.twitter.com
api_secret <- "" # From dev.twitter.com
token <- "" # From dev.twitter.com
token_secret <- "" # From dev.twitter.com


#beware this connection doesn't work in office or while using VPN!!!
# Create Twitter Connection
setup_twitter_oauth(api_key, api_secret, token, token_secret)


# Run Twitter Search. Format is searchTwitter("Search Terms", n=100, lang="en", geocode="lat,lng", also accepts since and until).

#search for tweets 50 Miles from a location

#tweets_geolocated <- searchTwitter("MTN", n=10, lang="en", geocode='6.820548058,-5.276741028,50mi', since="2016-1-1")

tweets_en <- searchTwitter("@vodacomtanzania OR vodacomtz OR #vodacomtanzania", n=2000, lang="en")

#tweets_en <- searchTwitter("ISIS OR ISIL OR Daish OR Daesh OR Islamic State group OR Islamic State OR ", n=1500, lang="en")

#tweets_ar <- searchTwitter("arabic_word", n=20, lang="ar")

# Transform tweets list into a data frame
tweets.dfen <- twListToDF(tweets_en)


#save data into CSV
write.csv(tweets.dfen, file = "Tweets_VodacomTZ2.csv")

