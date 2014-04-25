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
}

@property (nonatomic, retain) NSString *apiKey;

- (id)initWithApiKey:(NSString *)key;

@end
