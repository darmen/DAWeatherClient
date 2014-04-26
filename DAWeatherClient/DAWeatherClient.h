//
//  DAWeatherClient.h
//  
//
//  Created by Darmen Amanbayev on 4/25/14.
//
//

#import <Foundation/Foundation.h>

@interface DAWeatherClient : NSObject {
    NSString *apiKey;
    NSURLSession *session;
}

@property (nonatomic, retain) NSString *apiKey;
@property (nonatomic, retain) NSURLSession *session;

- (id)initWithApiKey:(NSString *)key;

- (void)weatherForLocation:(NSString*)location forDays:(int)days forDate:(NSDate *)date withBlock:(void (^)(NSDictionary *info))block;
- (void)weatherForTodayAtLocation:(NSString*)location forDays:(int)days withBlock:(void (^)(NSDictionary *info))block;

@end
