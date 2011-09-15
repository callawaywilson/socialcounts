## Social Counts Usage

### Share Counts:

You can get the number of times a link has been shared on various services by GETing (or POSTing) to the count action:

{% code html %}
GET http://counts.callawaywilson.com/shares[.html|.json|.xml]?url=[url]
{% endcode %}

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

### Examples

#### Get all the share counts for "twitter.com" on all sites in json format:

{% code html %}
GET http://counts.callawaywilson.com/shares.json?url=twitter.com
{% endcode %}

returns:

{% code json %}
[
	{"name": "facebook", "count": 2041060},
	{"name": "twitter", "count": 7110021},
	{"name": "buzz", "count": 181593},
	{"name": "linkedin", "count": 152017},
	{"name": "digg", "count": 2},
	{"name": "reddit", "count": 25},
	{"name": "stumbleupon", "count": 20765}
]
{% endcode %}

* * *

#### Get all the twitter share counts for github.com in json wrapped in a jsonp callback:
{% code html %}
GET http://counts.callawaywilson.com/shares.json?url=github.com&callback=parse_counts_response&type=twitter
{% endcode %}

returns

{% code javascript %}
parse_counts_response([{"name":"twitter","count":428}])
{% endcode %}

* * *

#### Get the share counts google.com in xml:
{% code html %}
GET http://counts.callawaywilson.com/shares.xml?url=google.com
{% endcode %}

returns

{% code xml %}
<objects type="array">
	<object>
		<name>facebook</name>
		<count type="integer">2242504</count>
	</object>
	<object>
		<name>twitter</name>
		<count type="integer">17</count>
	</object>
	<object>
		<name>buzz</name>
		<count type="integer">55331</count>
	</object>
	<object>
		<name>linkedin</name>
		<count type="integer">8602</count>
	</object>
	<object>
		<name>digg</name>
		<count type="integer">2</count>
	</object>
	<object>
		<name>reddit</name>
		<count type="integer">100</count>
	</object>
	<object>
		<name>stumbleupon</name>
		<count type="integer">198008</count>
	</object>
</objects>
{% endcode %}

