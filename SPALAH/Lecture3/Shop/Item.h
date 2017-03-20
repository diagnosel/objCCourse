//
//  Items.h
//  Shop
//
//  Created by Аурика Сарева on 15.03.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary;
-(NSString *)itemDescription;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSNumber *cost ;
@property (nonatomic, assign) NSNumber *availableNumber;
@property (nonatomic, strong) NSString *manufacturer;
@property (nonatomic, assign) BOOL hasDiscount;
@property (nonatomic, assign) NSDateFormatter *DateOfManufacture;

@end
