//
//  ViewController.m
//  TestNavigation
//
//  Created by Аурика Сарева on 07.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import "ViewController.h"
#import "Film.h"
#import "DetailsViewController.h"
#import "AddFilmViewController.h"

@interface ViewController () <AddFilmViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *films;
@property (strong, nonatomic) IBOutlet UITableView *tableV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readData];
}

- (void)readData {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Films" withExtension:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfURL:url];
    
    self.films = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in data) {
        Film *film = [[Film alloc] initWithDictionary:dict];
        [self.films addObject:film];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AddFilmViewControllerDelegate -

- (void)didAddFilm:(Film *)film {
    [self.films addObject:film];
    [self.tableV reloadData];
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.films.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    //self.view.backgroundColor = [UIColor orangeColor];
    //cell.backgroundColor = [UIColor orangeColor];
    
    Film *film = self.films[indexPath.row];
    
    cell.textLabel.text = film.title;
    
    cell.detailTextLabel.text = [film.rating stringValue];
    
    cell.imageView.image = [UIImage imageNamed:film.image];
    
    if ([cell.textLabel.text isEqualToString:@"Shawshank redemption"]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }   if ([cell.textLabel.text isEqualToString:@"Mask"]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }   if ([cell.textLabel.text isEqualToString:@"Matrix"]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }   if ([cell.textLabel.text isEqualToString:@"Star Wars: Episode III "]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }    if ([cell.textLabel.text isEqualToString:@"Ghost in the Shell"]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }    if ([cell.textLabel.text isEqualToString:@"Fight Club"]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }   if ([cell.textLabel.text isEqualToString:@"Schindler's List"]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }   if ([cell.textLabel.text isEqualToString:@"A Beautiful Mind"]) {
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"🍩%@",film.rating]];
        
    }
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[DetailsViewController class]]) {
        DetailsViewController *vc = segue.destinationViewController;
        

    // получение позиции выбранной ячейки
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    Film *film = self.films[selectedIndexPath.row];
    
    vc.selectedFilm = film;
    vc.title = film.title;
}
}

@end
