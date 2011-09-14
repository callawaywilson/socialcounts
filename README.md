# Social Counts

Social Counts is a quick service to query how many times a link has been mentioned on social web sites.  It's a restful HTTP service that speaks html, json, and xml.

## Help

Email me at: adam@callawaywilson.com

Social Counts is available running at: http://counts.callawaywilson.com

Source code & wiki is available on github: https://github.com/callawaywilson/socialcounts

## Usage

### Share Counts

You can get the number of times a link has been shared on various services by GETing (or POSTing) to the count action:

```
GET http://counts.callawaywilson.com/count[.html|.json|.xml]?url=[url]
```

Will return a web page for no extention or html, json data, or xml data.

Parameters:

* url: The url to fetch counts for from the services.  The url is not standardized or transformed in any way (except prefixing with http:// when omitted), so a 'www.' prefix may change the results.
* callback:  An optional jsonp callback to wrap the result in.  Won't work for html or xml types.
* type: An optional type of service to get the counts for.  If specified, only the counts for the particular service will be returned

Support types are:

* facebook
* twitter
* buzz
* linkedin
* reddit
* digg
* stumbleupon