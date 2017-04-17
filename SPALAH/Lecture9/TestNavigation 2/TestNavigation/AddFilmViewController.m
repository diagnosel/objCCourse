//
//  AddFilmViewController.m
//  TestNavigation
//
//  Created by Аурика Сарева on 13.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import "AddFilmViewController.h"
#import "Film.h"

@interface AddFilmViewController ()
@property (weak, nonatomic) IBOutlet UITextField *field;

@end

@implementation AddFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SaveTapped:(UIBarButtonItem *)sender {
    Film *film = [Film defaultFilm];
    film.title = self.field.text;
    
    if ([self.delegate respondsToSelector:@selector(didAddFilm:)]) {
        [self.delegate didAddFilm:film];
    }
    
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
