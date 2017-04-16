//
//  DetailsViewController.h
//  TestNavigation
//
//  Created by Аурика Сарева on 07.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Film.h"

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) Film *selectedFilm;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *artistsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *awardLabel;
@property (weak, nonatomic) IBOutlet UILabel *feesLabel;

@property (weak, nonatomic) IBOutlet UILabel *YearTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *ArtistsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *awardsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *feesTextLabel;


@end
