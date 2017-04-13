//
//  Film.h
//  TestNavigation
//
//  Created by Аурика Сарева on 07.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Film : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *artists;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSString *filmDescription;
@property (nonatomic, assign) NSString* image;
@property (nonatomic, assign) NSString* awards;
@property (nonatomic, assign) NSString* fees;

- (id)initWithDictionary:(NSDictionary*)dict;

@end
