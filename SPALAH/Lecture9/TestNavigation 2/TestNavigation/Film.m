//
//  Film.m
//  TestNavigation
//
//  Created by Аурика Сарева on 07.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import "Film.h"

@implementation Film

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        _title = dict[@"title"]; // objectForKey:
        _rating = dict[@"rating"];
        _artists = dict[@"artists"];
        _year = dict[@"year"];
        _filmDescription = dict[@"description"];
        _image = dict[@"image"];
        _awards = dict[@"awards"];
        _fees = dict[@"fees"];
    }
    
    return self;
}

@end
