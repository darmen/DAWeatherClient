//
//  DAWeatherClient.h
//  
//
//  Created by Darmen Amanbayev on 4/25/14.
//
//

#import <Foundation/Foundation.h>

#import "DAWeatherInfo.h"
#import "DATimeZoneInfo.h"

@interface DAWeatherClient : NSObject {
    NSString *apiKey;
    NSURLSession *session;
}

@property (nonatomic, retain) NSString *apiKey;
@property (nonatomic, retain) NSURLSession *session;

- (id)initWithApiKey:(NSString *)key;

- (void)weatherForLocation:(NSString*)location forDays:(int)days forDate:(NSDate *)date withBlock:(void (^)(DAWeatherInfo *info))block;
- (void)weatherForTodayAtLocation:(NSString*)location forDays:(int)days withBlock:(void (^)(DAWeatherInfo *info))block;

- (void)timeZoneForLocation:(NSString*)location withBlock:(void (^)(DATimeZoneInfo *info))block;
@end
