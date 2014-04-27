//
//  DAWeatherInfo.h
//  
//
//  Created by Darmen Amanbayev on 4/27/14.
//
//

#import <Foundation/Foundation.h>

@interface DATimeZoneInfo : NSObject

@property (nonatomic, strong) NSDate *localTime;
@property (nonatomic, strong) NSNumber *utcOffset;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
