internal
refresh
	"Uses the refresh token to acquire a new access token and refresh token."
	| payload |
	payload := ZnClient new
		https;
		host: 'www.googleapis.com';
		path: 'oauth2/v4/token';
		formAt: 'refresh_token' put: refreshToken;
		formAt: 'client_id' put: clientId;
		formAt: 'client_secret' put: clientSecret;
		formAt: 'grant_type' put: 'refresh_token';
		post.
	payload := STONJSON fromString: payload.
	accessToken := payload at: 'access_token'.
	expiry := DateAndTime now + (Duration seconds: (payload at: 'expires_in') asNumber)