This is a simple demo of various ways to Authenticate a user using WSO2 related products.

# Deploment folder structure
0) cd <project-dir> -- this is the place you want this effort to live
1) git@github.com:BechtelCanDoIt/WSO2-POC-Authentication.git
2) mkdir is
3) download IS 5.11.0 and copy the resulting unzipped files in the is folder so that you have is/wso2is-5.11.0
4) In the is/wso2is-5.11.0/bin/ folder find and execute wso2update for your OS version. (Twice to get latest)
5) cd <project-dir>
6) mkdir am
7) downlaod AM 4.0.0 and copy the resulting unzipped files in to the am folder so that you have am/wso2am-4.0.0
8) in the am/wso2am-4.0.0/bin/ folder find and execute wso2update for your OS. (Twice to get latest)


# Startup
startup.sh

# Stop
stop.sh

# Setup test data in IS Carbon Console - basic username/password from primary data store
## Add a new Service Provider[1]: 
Follow [1] then also check Skip Login Consent and Skip Logout Consent and click update button.


## Add a new user [2] 'DemoUser' with a valid email address.

# Carbon URL
If no other WSO2 product is running it should be: https://localhost.com:9443/carbon/admin/login.jsp
username: admin
password: admin


# Follow up Installations
cd <project-dir>
mkdir ignoreme <-- ignoreme is where you clone sub-projects into for building
cd ignoreme

## Magic Link 
Follow the directions on [3].
JAR file is actually in: identity-local-auth-magiclink/components/org.wso2.carbon.identity.application.authenticator.magiclink/target

## OAuth2-Grant-Rest (OTP, etc.)
Follow the directions on [4], [5], and [6].


---
[1] https://is.docs.wso2.com/en/5.11.0/learn/configuring-multi-factor-authentication-with-username-and-password/#try-it-out 
[2] https://is.docs.wso2.com/en/5.11.0/learn/adding-users-and-roles/#create-a-user
[3] https://github.com/wso2-extensions/identity-local-auth-magiclink
[4] https://github.com/wso2-extensions/identity-oauth2-grant-rest
[5] https://github.com/wso2-extensions/identity-outbound-auth-sms-otp
[6] https://github.com/wso2-extensions/identity-outbound-auth-email-otp
