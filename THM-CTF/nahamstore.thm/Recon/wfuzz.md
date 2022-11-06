#Recons
=> #marketing and #stock is so intersting

```
000000001:   301        7 L      13 W       194 Ch      "www"                                                                                                 
000000037:   301        7 L      13 W       194 Ch      "shop"                                                                                                
000000254:   200        41 L     92 W       2025 Ch     "marketing"                                                                                           
000000960:   200        0 L      1 W        67 Ch       "stock"
```
  
### I got a new subdomain. ```http://nahamstore-2020-dev.nahamstore.thm/``` I added it to my “/etc/hosts” file as well and scanned for the hidden dirctory again. ```dirb http://nahamstore-2020-dev.nahamstore.thm/``` then i found ```/api with CODE:302```. And then i'am trying to descover hidden dir using dirb again ```dirb http://nahamstore-2020-dev.nahamstore.thm/api/``` again i found anther dir called ```/customers``` with CODE:302

### when i am tried to see the web, it say ```customer_id is``` required" so i noticed one thing, if i add parameter called "customer_id" and give it value id 0-10, maybe i found some thing. 

# Boom! i found.

```
nahamstore-2020-dev.nahamstore.thm/api/customers/?customer_id=2
```


1. Jimmy Jones SSN 
answer = ```521-61-6392```

