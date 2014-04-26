//
//  ViewController.m
//  DAWeatherClient-Example
//
//  Created by Darmen Amanbayev on 4/26/14.
//  Copyright (c) 2014 Darmen Amanbayev. All rights reserved.
//

#import "ViewController.h"
#import "DAWeatherClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *pathToPlist = [NSString stringWithFormat:@"%@/key.plist",[[NSBundle mainBundle]resourcePath]];
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:pathToPlist];
    NSString *key = [plistDictionary objectForKey:@"key"];
    
    DAWeatherClient *client = [[DAWeatherClient alloc] initWithApiKey:key];
    [client weatherForTodayAtLocation:@"Astana" forDays:1 withBlock:^(DAWeatherInfo *info) {
        // info contains weather information
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
