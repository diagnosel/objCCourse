//
//  ViewController.m
//  Books
//
//  Created by Аурика Сарева on 03.04.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//

#import "ViewController.h"
#import "BooksDescription.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *toggleEditButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//свойство класса для хранения информации о книгах
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic, strong) NSArray* books;

//изменяемый массив, хранит параметры книг
@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic) CGFloat sectionFooterHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readData];
    
    [self showData];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


//чтение данных из массива plist

-(void)readData {
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"BooksList" withExtension:@"plist"];
    //массив из данных plist
    self.books = [NSArray arrayWithContentsOfURL:plistURL];
}
                  
//отображение данных
-(void)showData {
  
    NSLog(@"Data array %@", self.books);
    
    //текстовое представление каждой книги
    
    NSMutableArray* textRepresentation = [NSMutableArray array];
    
    //инициализация массива книг
    
    self.items = [[NSMutableArray alloc]init];
    
    for (NSDictionary* item in self.books) {
        BooksDescription *bookObj = [[BooksDescription alloc] initWithDictionary:item];
        
        [self.items addObject:bookObj];
        

        
       // NSString *result = [bookObj textDescription];
        
      //  [textRepresentation addObject:result];
        
    }
//результирующая строка
    NSString* resultString = [textRepresentation componentsJoinedByString:@"\n\n"];
    
    
    
//вывод результата
    
    self.resultLabel.text = resultString;
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //указываем количество элементов в секции таблицы
    return self.items.count;
}

//визуальное представление данных в ячейках
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cellId";
    //берем ячейку из очереди
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //если нет, то создаем
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    BooksDescription* item = [self.items objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:item.image];
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = [item textDescription];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    /*switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"0.jpg"];
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"2.jpg"];
            break;
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"3.jpg"];
            break;
        case 4:
            cell.imageView.image = [UIImage imageNamed:@"4.jpg"];
            break;
        default:
            break;
    }*/
    //цвет ячеек
        UIView *colorCell = [[UIView alloc] init];
    colorCell.backgroundColor = [UIColor grayColor];
    cell.backgroundView = colorCell;
    

    return cell;
}
    //header
    - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
        return @"BOOKS";
    }
//высота ячеек 60
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // получаем выбранную ячейку
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.items removeObjectAtIndex:indexPath.row];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
                [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        BooksDescription *item = [BooksDescription defaultItem];
        [self.items insertObject:item atIndex:indexPath.row];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
               [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationMiddle];
    }
    
    [tableView reloadData];
}

#pragma mark - UI actions -
- (IBAction)toggleButtonTapped:(id)sender {
    if (self.tableView.isEditing) {
        [self.tableView setEditing:NO animated:YES];
        self.toggleEditButton.titleLabel.text = @"";
        [self.toggleEditButton setTitle:@"Edit" forState:UIControlStateNormal];
        
    } else {
        [self.tableView setEditing:YES animated:YES];
        [self.toggleEditButton setTitle:@"Stop editing" forState:UIControlStateNormal];
    }

}

@end
  

