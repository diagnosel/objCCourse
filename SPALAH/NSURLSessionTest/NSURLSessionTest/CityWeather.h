

#import <Foundation/Foundation.h>

@interface CityWeather : NSObject

@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) NSString *stemperature;

@property (nonatomic, strong) NSNumber *pressure;
@property (nonatomic, strong) NSNumber *humidity;

@property (nonatomic, strong) NSNumber *windSpeed;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, strong) NSString *cityName;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end
