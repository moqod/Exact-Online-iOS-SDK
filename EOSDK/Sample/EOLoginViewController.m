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
	NSDictionary *keysDictionary = [NSDictionary dictionaryWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"Keys" ofType:@"plist"] ];
	NSString *clientId = keysDictionary[@"EOClientId"];
	NSString *secret = keysDictionary[@"EOSecret"];
	NSString *callbackURL = keysDictionary[@"EOCallbackURL"];
	
	NSAssert( clientId && secret && callbackURL , @"Provide clientId, secret and callback URL");
	
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
