internal
urlFor: scopes
	^ 'https://accounts.google.com/o/oauth2/v2/auth'
		, '?client_id=' , clientId urlEncoded
		, '&redirect_uri=' , 'http://127.0.0.1:15423' urlEncoded
		, '&response_type=code'
		, '&scope=' , (' ' join: scopes) urlEncoded
		, '&code_challenge_method=plain'
		, '&code_challenge=' , verifier urlEncoded