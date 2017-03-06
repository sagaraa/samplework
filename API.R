## the web part
con = url("http://scholar.google.com/citations?users=HI-I6C0AAAAJ&hl=en")
htmlcode = readLines(con)
close(con)
htmlcode##1way
##2nd way
library(XML)
url = "http://scholar.google.com/citations?users=HI-I6C0AAAAJ&hl=en"
html = htmlTreeParse(url, useInternalNodes = TRUE)
xpathSApply(html, "//title",xmlValue)
##3rd way
library(httr)
html2 = GET(url)
content2 = content(html2,as="text")
parsedhtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedhtml, "//title", xmlValue)

pg2 = GET(url, authenticate("user", "password"))

#handle ????
## the API part

## login as app like http://facebook.com/apps login here
myapp = oauth_app("website", key = "Consumerkey", secret = "ConsumerSecret")
sig = sign_oauth1.0(myapp,token = " Token here", token_secret = "Token Secret")
homeLT = GET(" Resource URL from doc/api ", sig)
json1 = content(homeLT)
json2 = jsonlite::fromJSON(toJSON(json1))
## allow GET PUT POST DELETE


library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",key = "56b637a5baffac62cad9",secret = "8e107541ae1791259e9987d544ca568633da2ebf")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)
