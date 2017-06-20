

#import "CityWeather.h"

@implementation CityWeather
- (instancetype)initWithDictionary:(NSDictionary*)dict {
    self = [super init];
    if (self) {
        NSDictionary *coord = dict[@"coord"];
        
        self.latitude = @([coord[@"lat"] floatValue]);
        self.longitude = @([coord[@"lon"] floatValue]);
        
        NSArray <NSDictionary*> *weather = dict[@"weather"];
        
        NSDictionary *weatherObj = weather.firstObject;
        self.iconName = weatherObj[@"icon"];
        
        NSDictionary *main = dict[@"main"];
        self.temperature = main[@"temp"];
        float temp1 = self.temperature.floatValue;
        temp1 = temp1 - 273.0;
        self.stemperature = [NSString stringWithFormat:@"%.1f", temp1];
        
        self.pressure = main[@"pressure"];
        self.humidity = main[@"humidity"];

        NSDictionary *wind = dict[@"wind"];
        self.windSpeed = wind[@"speed"];
        
        NSNumber *dt = dict[@"dt"];
        
        self.date = [NSDate dateWithTimeIntervalSince1970:dt.floatValue];
        
        self.cityName = dict[@"name"];
    }
    
    return self;
}
@end
