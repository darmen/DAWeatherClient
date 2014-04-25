//
//  DAWeatherClient.m
//  
//
//  Created by Darmen Amanbayev on 4/25/14.
//
//

#import "DAWeatherClient.h"

@implementation DAWeatherClient

@synthesize apiKey;

- (id)init {
    return [self initWithApiKey:@""];
}


- (id)initWithApiKey:(NSString *)key {
    if (self = [super init]) {
        apiKey = key;
        
        if ([apiKey isEqualToString:@""]) {
            @throw([NSException exceptionWithName:@"InvalidArgumentException" reason:@"API Key cannot be empty." userInfo:nil]);
        }
    }
    
    return self;
}


@end