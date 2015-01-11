//
//  EOLoginViewController.m
//  EOSDK
//
//  Created by Andrew Kopanev on 1/10/15.
//  Copyright (c) 2015 Moqod. All rights reserved.
//

#import "EOLoginViewController.h"
#import "EOGLAccountsTableViewController.h"

#import "EOAPIProvider.h"

@interface EOLoginViewController ()

@property (nonatomic, strong) IBOutlet UIButton		*loginButton;

@end

@implementation EOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Exact Online";
	[self.loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - actions

- (void)loginAction:(UIButton *)sender {

#warning Set your Exact credentials below
    
	NSString *clientId = @"<YOUR_CLIENT_ID>";
	NSString *secret = @"<YOUR_SECRET>";
	NSString *callbackURL = @"<YOUR_CALLBACK_URL>";
	
	// Use your clientId, secret and callback URL here
	[[EOAPIProvider providerWithClientId:clientId secret:secret] authorizeWithCallbackURL:callbackURL completion:^(NSError *error) {
		if (!error) {
			[self.navigationController pushViewController:[EOGLAccountsTableViewController new] animated:YES];
		} else {
			NSLog(@"error == %@", error);
		}
	}];
}

@end
