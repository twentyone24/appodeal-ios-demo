//
//  ASInterstitialViewController.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASInterstitialViewController.h"
#import <Appodeal/Appodeal.h>


@interface ASInterstitialViewController ()<AppodealInterstitialDelegate>

@property (strong, nonatomic) IBOutlet UITextField *placementField;

@end

@implementation ASInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Appodeal setInterstitialDelegate:self];
}

- (IBAction)showClick:(UIButton *)sender {
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    if ([Appodeal canShow:AppodealAdTypeInterstitial forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleInterstitial forPlacement:placement rootViewController:self];
    }
}

#pragma mark - AppodealInterstitialDelegate

- (void)interstitialDidLoadAdIsPrecache:(BOOL)precache {}
- (void)interstitialDidFailToLoadAd {}
- (void)interstitialDidFailToPresent {}
- (void)interstitialWillPresent {}
- (void)interstitialDidDismiss {}
- (void)interstitialDidClick {}

@end
