//
//  Items.m
//  Shop
//
//  Created by Аурика Сарева on 15.03.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import "Item.h"
#define MARKUP(cost, percent) (cost * percent)

@implementation Item

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if( self = [super init] )
    {
        _title = dictionary[@"title"];
        _cost = dictionary[@"cost"];
        _availableNumber = dictionary[@"availableNumber"];
        _manufacturer = dictionary[@"manufacturer"];
        _hasDiscount = [dictionary[@"hasDiscount"] boolValue];
        _DateOfManufacture = dictionary[@"DateOfManufacture"];
    }
    
    return self;
}

- (NSString *)itemDescription
{
    return [NSString stringWithFormat:@"Title - %@, cost - %@, available number - %@, manufacturer - %@, has discount -  %s, Date of manufacture - %@, MARKUP - %.2f",
     _title,
     _cost,
     _availableNumber,
     _manufacturer,
     (_hasDiscount == 1 ? "yes" : "no"),
     _DateOfManufacture,
     MARKUP([_cost intValue], 1.2)];
}

+ (Item*)defaultItem {
    Item *item = [Item new];
    item.title = @"Test";
    item.cost = [NSNumber numberWithInt:12];
    item.availableNumber = [NSNumber numberWithInt:5];
    item.manufacturer = @"China";
    item.hasDiscount = YES;
    item.DateOfManufacture = [NSDate date];
    
    return item;
}
@end
