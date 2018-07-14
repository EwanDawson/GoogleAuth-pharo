accessing
accessToken
	"Returns a valid access token. Can't be called until after authenticateFor: has been called.
	Handles refreshing the token, and the first time redeeming the authorization code for both tokens."
	accessToken ifNil: [ self redeemCode. ^ accessToken ].
	self needRefresh ifTrue: [ self refresh ].
	^ accessToken