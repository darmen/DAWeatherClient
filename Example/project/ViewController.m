//
//  ViewController.m
//  project
//
//  Created by Darmen Amanbayev on 4/25/14.
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
    
    DAWeatherClient *client = [[DAWeatherClient alloc] initWithApiKey:[plistDictionary objectForKey:@"key"]];
    [client weatherForLocation:@"Astana" withBlock:^(NSDictionary *info){
        NSLog(@"weather info: %@", info);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
