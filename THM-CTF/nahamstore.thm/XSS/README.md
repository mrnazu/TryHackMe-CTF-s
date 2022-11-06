<h1 align=center>Cross site scripting attack/XSS</h1>

# TASK 8
## What other hidden parameter can be found on the shop which can introduce an XSS vulnerability

#### to be honest i spend 1+ hour for this question. don't try manually. use burp suite instead of it.

first click on the products from "sticker pack" and "hoodie", then type discount coupon code and hit "add to basket" button, remember use burp to capture this request

## Request

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


