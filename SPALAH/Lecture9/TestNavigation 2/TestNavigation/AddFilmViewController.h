//
//  AddFilmViewController.h
//  TestNavigation
//
//  Created by Аурика Сарева on 13.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Film;

@protocol AddFilmViewControllerDelegate <NSObject>

- (void)didAddFilm:(Film *)film;

@end

@interface AddFilmViewController : UIViewController

@property (weak, nonatomic) id<AddFilmViewControllerDelegate> delegate;

@end
