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

- (NSDictionary *)dictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:self.title forKey:@"title"];
    [dict setObject:self.rating forKey:@"rating"];
    [dict setObject:self.artists forKey:@"artists"];
    [dict setObject:self.year forKey:@"year"];
    [dict setObject:self.filmDescription forKey:@"description"];
    [dict setObject:@"" forKey:@"image"];
    [dict setObject:self.awards forKey:@"awards"];
    [dict setObject:self.fees forKey:@"fees"];
    return dict;
}

+ (Film*)defaultFilm {
    Film *film = [Film new];
    film.title = @"Test";
    film.rating = @"10";
    film.artists = @"Matthew McConaughey";
    film.year = @"1999";
    film.filmDescription = @"Fairytale";
    film.awards = @"Oscar, Golden globe";
    film.fees = @"$313 542 341";
    film.image = nil;
    
    return film;
}

@end
