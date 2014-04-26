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

- (void)weatherForTodayAtLocation:(NSString *)location forDays:(int)days withBlock:(void (^)(DAWeatherInfo *))block
{
    [self weatherForLocation:location forDays:1 forDate:[NSDate date] withBlock:block];
}

- (void)weatherForLocation:(NSString*)location forDays:(int)days forDate:(NSDate *)date withBlock:(void (^)(DAWeatherInfo *info))block {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-mm-dd"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    
    NSURL *url = [self constructURLWithBase:@"api.worldweatheronline.com/free/v1/weather.ashx"
                              andParameters:@{
                                              @"key": apiKey,
                                              @"q": location,
                                              @"num_of_days": @(days),
                                              @"date": stringFromDate,
                                              @"show_comments": @"no",
                                              @"format": @"json",
                                              @"extra": @"localObsTime"
                                              }];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                            DAWeatherInfo *info = [[DAWeatherInfo alloc] initWithDictionary:json];
                                            block(info);
                                        }
                                  ];
    [task resume];
}

- (NSURL*)constructURLWithBase:(NSString *)baseURLString andParameters:(NSDictionary *)parameters
{
    NSString *urlString = [NSString stringWithFormat:@"http://%@?", baseURLString];

    NSEnumerator *enumerator = [parameters keyEnumerator];
    NSString *key;
    
    while ((key = [enumerator nextObject])) {
        NSString *value = [parameters objectForKey:key];
        urlString = [urlString stringByAppendingFormat:@"%@=%@&", key, value];
    }
    
    urlString = [urlString substringToIndex:[urlString length] - 1];
    
    return [NSURL URLWithString:urlString];
}


@end