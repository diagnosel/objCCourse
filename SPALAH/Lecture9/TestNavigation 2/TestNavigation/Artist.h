//
//  Artist.h
//  TestNavigation
//
//  Created by Аурика Сарева on 24.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *born;
@property (nonatomic, strong) NSString *place_born;
@property (nonatomic, strong) NSString *genres;
@property (nonatomic, strong) NSString *total_films;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSMutableArray *films;

- (id)initWithDictionary:(NSDictionary*) dictionary;

- (NSString *) itemDescription;

@end
