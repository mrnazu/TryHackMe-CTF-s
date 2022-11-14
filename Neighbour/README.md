<h1 align=center>Neighbour</h1>
<h3 align=center>Check out our new cloud service, Authentication Anywhere. Can you find other user's secrets?</h3>

##### Check out our new cloud service, Authentication Anywhere -- log in from anywhere you would like! Users can enter their username and password, for a totally secure login process! You definitely wouldn't be able to find any secrets that other people have in their profile, right?


###### if u see the source code we will get guest account! and it say admin account is limit.
```
username = guest
password = guest
```
```
http://10.10.130.69/profile.php?user=guest
```

###### then after loged in with guest account, again we will se the source code. and we will get this text inside comment tag 
```
<!-- admin account could be vulnerable, need to update -->
```

###### if you notice it say admin account is vulnerable, so maybe the user name is admin? lemm check and also if you notice in the end of url paramameter ?user=guest. now if i change the guest into admin, what will happen?

###### go back into your tryhackme, and it say: Check out similar content on TryHackMe: IDOR. so maybe it's vulnerable to IDOR.
 
# boom!

```http://10.10.130.69/profile.php?user=admin 
```
## => Hi, admin. Welcome to your site. The flag is: 
```flag{66be95c478473d91a5358f2440c7af1f}```
