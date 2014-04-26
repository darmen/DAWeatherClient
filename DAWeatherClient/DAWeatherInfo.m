//
//  DAWeatherInfo.m
//  
//
//  Created by Darmen Amanbayev on 4/26/14.
//
//

#import "DAWeatherInfo.h"

@implementation DAWeatherInfo

@synthesize cloudCover;
@synthesize humidity;
@synthesize observationDate;
@synthesize precipitation;
@synthesize pressure;
@synthesize temperatureCelsius;
@synthesize temperatureFahrenheit;
@synthesize visibility;
@synthesize weatherCode;
@synthesize weatherDescription;
@synthesize weatherIconUrl;
@synthesize windDirection16Point;
@synthesize windDirectionDegree;
@synthesize windSpeedKilometersPerHour;
@synthesize windSpeedMilesPerHour;


- (id)init {
    return [self initWithDictionary:@{}];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        dictionary = dictionary[@"data"][@"current_condition"][0];
        cloudCover = [(NSNumber *)[dictionary objectForKey:@"cloudcover"] intValue];
        humidity = [(NSNumber *)[dictionary objectForKey:@"humidity"] intValue];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-M-dd hh:mm a"];
        observationDate = [dateFormatter dateFromString:dictionary[@"localObsDateTime"]];
        
        precipitation = [(NSNumber *)[dictionary objectForKey:@"precipMM"] intValue];
        pressure = [(NSNumber *)[dictionary objectForKey:@"pressure"] intValue];
        temperatureCelsius = [(NSNumber *)[dictionary objectForKey:@"temp_C"] intValue];
        temperatureFahrenheit = [(NSNumber *)[dictionary objectForKey:@"temp_F"] intValue];
        visibility = [(NSNumber *)[dictionary objectForKey:@"visibility"] intValue];
        weatherCode = [(NSNumber *)[dictionary objectForKey:@"weatherCode"] intValue];
        weatherDescription = dictionary[@"weatherDesc"][0][@"value"];
        weatherIconUrl = dictionary[@"weatherIconUrl"][0][@"value"];
        windDirection16Point = [dictionary objectForKey:@"winddir16Point"];
        windDirectionDegree = [(NSNumber *)[dictionary objectForKey:@"winddirDegree"] intValue];
        windSpeedKilometersPerHour = [(NSNumber *)[dictionary objectForKey:@"windspeedKmph"] intValue];
        windSpeedMilesPerHour = [(NSNumber *)[dictionary objectForKey:@"windspeedMiles"] intValue];
    }
    
    return self;
}


@end
