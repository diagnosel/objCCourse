

#import "ViewController.h"
#import "CityWeather.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<UITextFieldDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) CityWeather *weather;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *cityField;

@property (strong, nonatomic) CLLocationManager *manager;

@property (strong, nonatomic) CLLocation *userLocation;

@property (strong, nonatomic) CLGeocoder *geocoder;

@end

NSString* const API_KEY = @"cd84cd7adae8897f778fde9216c8e296"; 

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
    
    if ([CLLocationManager locationServicesEnabled]) {
        [self.manager startUpdatingLocation];
    }
}

- (void)reloadUI {
    //self.temperatureLabel.text = self.weather.stemperature;
    self.temperatureLabel.text = [self.weather.stemperature stringByAppendingString:@" \t°C"];
    self.humidityLabel.text = [self.weather.humidity.stringValue stringByAppendingString:@" \t%"];
    self.windSpeedLabel.text = [self.weather.windSpeed.stringValue stringByAppendingString:@" \tm/s"];
    self.pressureLabel.text = [self.weather.pressure.stringValue stringByAppendingString:@" \tmmhg"];
    
    self.cityNameLabel.text = self.weather.cityName;
}

- (void)setWeather:(CityWeather *)weather {
    _weather = weather;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadUI];
    });
}

#pragma mark - UITextfieldDelegate -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self getWeatherForCityWithName:textField.text];
    [textField resignFirstResponder];

    return YES;
}

#pragma mark - Network -

- (void)getWeatherForCityWithName:(NSString*)cityName {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@", cityName, API_KEY];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    __weak typeof(self) wSelf = self;
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                wSelf.weather = [[CityWeather alloc] initWithDictionary:json];
                                                [wSelf getWeatherImage];
                                                
                                            }];
    
    [task resume];
}

- (void)getWeatherForUserLocation {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%@", 
    self.userLocation.coordinate.latitude, 
    self.userLocation.coordinate.longitude, API_KEY];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    __weak typeof(self) wSelf = self;
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                wSelf.weather = [[CityWeather alloc] initWithDictionary:json];
                                                [wSelf getWeatherImage];
                                                
                                            }];
    
    [task resume];
}

- (void)getWeatherImage {
    NSString *path = @"http://openweathermap.org/img/w/";
    NSString *imageName = [NSString stringWithFormat:@"%@.png", self.weather.iconName];
    NSString *urlString = [path stringByAppendingString:imageName];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url
     completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         NSLog(@"path %@", location);
         
         NSData *data = [NSData dataWithContentsOfURL:location];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             self.imageView.image = [UIImage imageWithData:data];
         });

     }];
     
    [task resume];
}
// lazy instantiation 
- (CLLocationManager *)manager {
    if (!_manager) {
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
    }
    return _manager;
}

- (CLGeocoder *)geocoder {
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    
    return _geocoder;
}

#pragma mark - Location manager events -

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.userLocation = locations.firstObject;
    [self getWeatherForUserLocation];
    [self requestReverseGeocodeInfo];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus) status {
    
    if (status == kCLAuthorizationStatusDenied) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Please enable location"
         message:@"Please enable location for getting weather info" 
    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Go To Settings" 
        style:UIAlertActionStyleDefault
         handler:^(UIAlertAction * _Nonnull action) {
             [[UIApplication sharedApplication] 
              openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
         }];
         
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" 
        style:UIAlertActionStyleCancel 
        handler:nil];
        
        [alert addAction:settingsAction];
        [alert addAction:cancel];
        
        [self presentViewController:alert
         animated:YES
          completion:nil];
    }
}

#pragma mark - Geocoding -

- (void)requestReverseGeocodeInfo {
    [self.geocoder reverseGeocodeLocation:self.userLocation
     completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
         if (error == nil) {
             CLPlacemark *placemark = placemarks.firstObject;
             self.cityField.text = placemark.locality;
         }
     }];
}

@end
