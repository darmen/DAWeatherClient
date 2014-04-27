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

@synthesize client = _client;
@synthesize locationTextfield = _locationTextfield;
@synthesize weatherInfoTextview = _weatherInfoTextview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *pathToPlist = [NSString stringWithFormat:@"%@/key.plist",[[NSBundle mainBundle]resourcePath]];
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:pathToPlist];
    NSString *key = [plistDictionary objectForKey:@"key"];
    
    _client = [[DAWeatherClient alloc] initWithApiKey:key];
}

- (IBAction)getWeather:(id)sender {
    [_client weatherForTodayAtLocation: _locationTextfield.text forDays:1 withBlock:^(DAWeatherInfo *info) {
        NSString *weatherInfo = [NSString stringWithFormat:@"Temperature: %d Celsius.\nCloud cover: %d%%\nWind speed and direction: %d km/h, %@", info.temperatureCelsius, info.cloudCover, info.windSpeedKilometersPerHour, info.windDirection16Point];
        _weatherInfoTextview.text = weatherInfo;
        [_locationTextfield resignFirstResponder];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
