//
//  BooksDescription.h
//  Books
//
//  Created by Аурика Сарева on 06.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BooksDescription : NSObject

- (id)initWithDictionary:(NSDictionary *)otherDictionary;
- (NSString *)textDescription;

+ (BooksDescription*)defaultItem;

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString* publisher;
@property (nonatomic, assign) NSNumber* numberPages;
@property (nonatomic, assign) NSDateFormatter* yearPublication;
@property (nonatomic, assign) BOOL hasStock;
@property (nonatomic, assign) NSString* image;


@end
