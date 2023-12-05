```
WARNING: This is still Work in Progress and not ready for use!
```


This is a simple demo of various ways to Authenticate a user using WSO2 related products.

# Deployment folder structure - PRE-REQ Step
## identity-oauth2-grant-rest
- Go to https://store.wso2.com/store/assets/isconnector/details/1ce96049-84ed-42e2-a249-82715b3c25c2
- Click Download Authenticator
- Click Download Artifacts
- Copy the results to <POC-AUTHENTICATION>/wso2-config/is-src/identity-oauth2-grant-rest

# Startup
```
startup.sh
```

# Stop
```
stop.sh
```

# Setup test data in IS Carbon Console - basic username/password from primary data store
## Add a new Service Provider[1]: 
```
Follow [1] then also check Skip Login Consent and Skip Logout Consent and click update button.
```

## Add a new user [2] 'DemoUser' with a valid email address.

# API-M Carbon URL
```
If no other WSO2 product is running it should be: https://localhost.com:9443/carbon/admin/login.jsp
username: admin
password: admin
```


---
# Helpful Reference Links
```
[1] https://is.docs.wso2.com/en/5.11.0/learn/configuring-multi-factor-authentication-with-username-and-password/#try-it-out 
[2] https://is.docs.wso2.com/en/5.11.0/learn/adding-users-and-roles/#create-a-user
[3] https://github.com/wso2-extensions/identity-local-auth-magiclink
[4] https://github.com/wso2-extensions/identity-oauth2-grant-rest
[5] https://github.com/wso2-extensions/identity-outbound-auth-sms-otp
[6] https://github.com/wso2-extensions/identity-outbound-auth-email-otp
```