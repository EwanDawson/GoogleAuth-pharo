I handle authenticating with Google using OAuth 2.

I use the system's web browser to authenticate the user, and return OAuth credentials you can use to talk to Google services on your user's behalf.
I use the flow for desktop apps with a local web server.

Setup:
- Go to https://console.cloud.google.com, create a project if you don't already have one, and go to Library -> Credentials.
- Select Create credentials -> OAuth client ID.
- Select type 'Other' and name your client.
- Copy the client ID and client secret, and include them in your Pharo code.

Usage:
GoogleAuth new
	clientID: 'asdfasdfasdf.apps.googleusercontent.com';
	clientSecret: 'bASe64_encodedSecret123';
	authenticateFor: { 'email'. 'profile' }
	
Then you can call
	myAuth accessToken
any time to get the Bearer token to send to Google API requests. GoogleAuth handles refreshing the tokens, which have a limited lifespan.
NB: You should call accessToken right before every request, to make sure the token gets refreshed as necessary.

Some users of GoogleAuth (eg. Firebase classes) want the whole object.