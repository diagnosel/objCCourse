//
//  RatingViewController.h
//  TestNavigation
//
//  Created by Аурика Сарева on 24.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Film.h"
#import "DetailsViewController.h"

@interface RatingViewController : UIViewController
@property (strong, nonatomic) Film *selectedFilm;

- (void) AddRating:(NSNumber *) rating;

@end
