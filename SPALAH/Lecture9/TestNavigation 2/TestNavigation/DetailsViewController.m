//
//  DetailsViewController.m
//  TestNavigation
//
//  Created by Аурика Сарева on 07.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import "DetailsViewController.h"


@interface DetailsViewController ()


@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
//    self.titleLabel.text = self.selectedFilm.title;
 //   self.detailsLabel.text = self.selectedFilm.filmDescription;

    self.titleLabel.text = _selectedFilm.title;
    self.descriptionLabel.text = _selectedFilm.filmDescription;
    self.imageView.image = [UIImage imageNamed:_selectedFilm.image];
    self.YearTextLabel.text = _selectedFilm.year;
    self.ArtistsTextLabel.text = _selectedFilm.artists;
    self.ratingTextLabel.text = _selectedFilm.rating;
    self.awardsTextLabel.text = _selectedFilm.awards;
    self.feesTextLabel.text = _selectedFilm.fees;
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
}


//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//}

- (IBAction)doneTapped:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
