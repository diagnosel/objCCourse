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

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *films;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readData];
    
   // [self showData];
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.films.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    self.view.backgroundColor = [UIColor orangeColor];
    cell.backgroundColor = [UIColor orangeColor];
    
    Film *film = self.films[indexPath.row];
   
    
    cell.imageView.image = [UIImage imageNamed:film.image];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.textLabel.text = film.title;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailsViewController *vc = segue.destinationViewController;
    // получение позиции выбранной ячейки
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    Film *film = self.films[selectedIndexPath.row];
    
    vc.selectedFilm = film;
    vc.title = film.title;
}


@end
