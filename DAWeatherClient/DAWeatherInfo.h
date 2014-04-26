//
//  DAWeatherInfo.h
//  
//
//  Created by Darmen Amanbayev on 4/26/14.
//
//

#import <Foundation/Foundation.h>

@interface DAWeatherInfo : NSObject

@property (nonatomic) int cloudCover;
@property (nonatomic) int humidity;
@property (nonatomic, strong) NSDate *observationDate;
@property (nonatomic) int precipitation;
@property (nonatomic) int pressure;
@property (nonatomic) int temperatureCelsius;
@property (nonatomic) int temperatureFahrenheit;
@property (nonatomic) int visibility;
@property (nonatomic) int weatherCode;
@property (nonatomic, retain) NSString *weatherDescription;
@property (nonatomic, retain) NSString *weatherIconUrl;
@property (nonatomic, retain) NSString *windDirection16Point;
@property (nonatomic) int windDirectionDegree;
@property (nonatomic) int windSpeedKilometersPerHour;
@property (nonatomic) int windSpeedMilesPerHour;


- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
