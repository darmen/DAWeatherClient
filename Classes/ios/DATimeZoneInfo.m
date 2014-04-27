//
//  DAWeatherInfo.m
//  
//
//  Created by Darmen Amanbayev on 4/27/14.
//
//

#import "DATimeZoneInfo.h"

@implementation DATimeZoneInfo

@synthesize localTime;
@synthesize utcOffset;


- (id)init {
    return [self initWithDictionary:@{}];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        dictionary = dictionary[@"data"][@"time_zone"][0];

        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-M-dd hh:mm"];
        localTime = [dateFormatter dateFromString:dictionary[@"localtime"]];
        
        utcOffset = dictionary[@"utcOffset"];
    }
    
    return self;
}


@end
