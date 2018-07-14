authenticators
authenticateFor: scopes
	"Run the authentication flow for the Client ID and collection of scopes (sequenceable collection of strings).
	Blocks until the flow is complete, so run it on a thread if you don't want it to hold up your UI.
	TODO: Error handling!"
	| lock server |
	lock := Semaphore new.
	verifier := self generateVerifier.
	server := ZnServer on: 15423.
	server delegate: (ZnValueDelegate with: [ :req |
		authCode := req uri queryAt: 'code'.
		lock signal.
		ZnResponse ok: self landingPage ]).
	server start.

	WebBrowser openOn: (self urlFor: scopes).
	lock isSignaled ifFalse: [ lock wait ].
	server stop.
	self redeemCode