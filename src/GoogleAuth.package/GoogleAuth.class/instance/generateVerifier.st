internal
generateVerifier
	"Generates a 'code verifier' for the OAuth flow.
	This is a 96-character string containing the characters [A-Za-z0-9._~-]."
	| base code |
	base := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~' asOrderedCollection.
	code := String new: 96.
	1 to: 96 do: [ :i | code at: i put: base atRandom ].
	^ code