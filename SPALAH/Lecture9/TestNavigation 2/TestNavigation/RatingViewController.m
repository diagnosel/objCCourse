//
//  RatingViewController.m
//  TestNavigation
//
//  Created by Аурика Сарева on 24.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//
#import "AddFilmViewController.h"
#import "RatingViewController.h"

@interface RatingViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button10;


@end

@implementation RatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.selectedFilm.title;
    [self AddRating:self.selectedFilm.rating];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)RatingButtonClick:(id)sender {
    if (![sender isKindOfClass:[UIButton class]])
        return;
    
    self.selectedFilm.rating = [NSNumber numberWithInteger:[(UIButton *)sender tag] + 1];
    
    [self AddRating:self.selectedFilm.rating];
}

- (void) AddRating:(NSNumber *) rating {
    if ([rating integerValue] < 11){
        
        ([rating integerValue] >= 1) ? [self.button1 setSelected:YES] : [self.button1 setSelected:NO];
        ([rating integerValue] >= 2) ? [self.button2 setSelected:YES] : [self.button2 setSelected:NO];
        ([rating integerValue] >= 3) ? [self.button3 setSelected:YES] : [self.button3 setSelected:NO];
        ([rating integerValue] >= 4) ? [self.button4 setSelected:YES] : [self.button4 setSelected:NO];
        ([rating integerValue] >= 5) ? [self.button5 setSelected:YES] : [self.button5 setSelected:NO];
        ([rating integerValue] >= 1) ? [self.button6 setSelected:YES] : [self.button6 setSelected:NO];
        ([rating integerValue] >= 2) ? [self.button7 setSelected:YES] : [self.button7 setSelected:NO];
        ([rating integerValue] >= 3) ? [self.button8 setSelected:YES] : [self.button8 setSelected:NO];
        ([rating integerValue] >= 4) ? [self.button9 setSelected:YES] : [self.button9 setSelected:NO];
        ([rating integerValue] >= 5) ? [self.button10 setSelected:YES] : [self.button10 setSelected:NO];
    }
}

- (IBAction)DoneTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
