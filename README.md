![Logo](https://apps.exactonline.com/content/css/images/exact-logo-red.png)

# iOS Exact Online SDK

[Exact Online](http://www.exactonline.com/) is the business software that automates your manufacturing, logistics and CRM in the cloud.
<br/> This Objective-C SDK provides easy access to Exact Online API for iOS apps. More information about [Exact Online](http://www.exactonline.com/), [API Documentation](https://developers.exactonline.com/).
Feel free to get in touch with us in regards to any questions or cooperation requests via email [info@moqod.com](mailto:info@moqod.com).
Project contains sample app which allows to authorize and grab all GLAccounts.

# Features
- Authorization & Token refreshing
- REST API access

# Todo
- XML / CSV API support
- Sample app with more features
<br/>Feel free to contact for feature requests, support or pull requests, if you would like to contribute!

# Notes
## OData
Use `odataParams` parameter in methods, see sample for more details. We don't see any reason for real OData implementation now, `NSDictionary` is enough.

## Division
Almost all API methods require `division` parameter. `EOAPIProvider` has property `currentDivision`, this property is setup automatically after requesting `current/Me` API method, also it is possible to setup any value you want (if you need to support multiple accounts).

## Paging
Exact Online API Documentaion: *All CRUD services have a limition of maximum 60 records within one API request. The READ services will soon have a similar limitation.*<br />
If you need all items with one line of code then you could use `grabAllItems` parameter in method:
``` objc
- (NSOperation *)restGetAPI:(NSString *)apiName division:(NSString *)division odataParams:(NSDictionary *)odataParams grabAllItems:(BOOL)grabAllItems completion:(EOAPICompletion)completion;
```

## Data Models
We decided not to use any data objects / bindings because this really varies for custom needs. All data returned using NSDictionary / NSArray and standart ObjC classes, so it's up to you - you could write a wrapper for bindings and do everything you need.

# 3rd party Libraries
This library uses [AFNetworking](https://github.com/AFNetworking/AFNetworking) and [AFOAuth2Manager](https://github.com/AFNetworking/AFOAuth2Manager).
Project does not use cocoapods at the moment, you can clone / download SDK and play with API.

# Sample
Authorization
``` objc
	[[EOAPIProvider providerWithClientId:clientId secret:secret] authorizeWithCallbackURL:callbackURL completion:^(NSError *error) {
		if (!error) {
			// ...
		} else {
		  // handle error
			NSLog(@"error == %@", error);
		}
	}];
```

Request an API
``` objc
	[[EOAPIProvider anyProvider] restGetAPI:@"current/Me" completion:^(NSArray *results, NSError *error) {
		if (!error) {
			[self requestAccounts];
		} else {
			[self handleError:error];
		}
	}];
```

Request an API with additional parameters
``` objc
		[[EOAPIProvider anyProvider] restGetAPI:@"financial/GLAccounts" division:[EOAPIProvider anyProvider].currentDivision odataParams:@{ @"$orderby" : @"Description" } grabAllItems:YES completion:^(NSArray *results, NSError *error) {
			if (!error) {
				self.glAccountsList = results;
				[self.tableView reloadData];
			} else {
				[self handleError:error];
			}
		}];
```
# License
This SDK is distributed under MIT license.