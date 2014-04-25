//
//  DAWeatherClient.m
//  
//
//  Created by Darmen Amanbayev on 4/25/14.
//
//

#import "DAWeatherClient.h"

@implementation DAWeatherClient

@synthesize apiKey, session;

- (id)init {
    return [self initWithApiKey:@""];
}


- (id)initWithApiKey:(NSString *)key {
    if (self = [super init]) {
        
        
        if ([key isEqualToString:@""]) {
            @throw([NSException exceptionWithName:@"InvalidArgumentException" reason:@"API Key cannot be empty. Please provide the right key on key.plist under key 'key'. :)" userInfo:nil]);
        }
        
        apiKey = key;
        session = [NSURLSession sharedSession];
    }
    
    return self;
}

- (void)requestWeather {
    NSString *urlString = [NSString stringWithFormat:@"http://api.worldweatheronline.com/free/v1/weather.ashx?q=Astana&format=json&key=%@", apiKey];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                            NSLog(@"%@", json);
                                        }
                                  ];
    [task resume];
}


@end