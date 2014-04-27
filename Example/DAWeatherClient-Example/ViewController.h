//
//  ViewController.h
//  DAWeatherClient-Example
//
//  Created by Darmen Amanbayev on 4/26/14.
//  Copyright (c) 2014 Darmen Amanbayev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAWeatherClient.h"

@interface ViewController : UIViewController
@property (nonatomic, retain) DAWeatherClient *client;
@property (nonatomic, retain) IBOutlet UITextField *locationTextfield;
@property (nonatomic, retain) IBOutlet UITextView *weatherInfoTextview;

- (IBAction)getWeather:(id)sender;
@end
