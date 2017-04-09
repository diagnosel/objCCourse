//
//  BooksDescription.m
//  Books
//
//  Created by Аурика Сарева on 06.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import "BooksDescription.h"

@implementation BooksDescription

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if( self = [super init] )
    {
        _author = dictionary[@"author"];
        _title = dictionary[@"title"];
        _publisher = dictionary[@"publisher"];
        _numberPages = dictionary[@"number of pages"];
        _yearPublication = dictionary[@"year of publication"];
        _hasStock = dictionary[@"hasInStock"];
    }
    return self;
    
}

- (NSDateFormatter*)dateFormatter {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterShortStyle;
    return df;
}

- (NSString *)textDescription
{
    return [NSString stringWithFormat:@"author - %@, title - %@, publisher - %@, number of pages - %@, year of publication - %@, has in stock - %s",
            _author,
            _title,
            _publisher,
            _numberPages,
            _yearPublication,
            (_hasStock == 1 ? "YES" : "NO")];
}


@end
