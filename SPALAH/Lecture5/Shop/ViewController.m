//
//  ViewController.m
//  Shop
//
//  Created by Аурика Сарева on 12.03.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//
#import "item.h"
#import "ViewController.h"

//нужно определить источник данных для нашей таблицы, это можно посмотреть UITableView.h (@property (nonatomic, weak, nullable) id <UITableViewDataSource> dataSource;)

//добавим реализацию протокола UITableViewDatasource в наш класс (<UITableViewDataSource>)

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

//добавим аутлет нашей таблицы
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//объявляем свойство класса для хранения информации о наших товарах
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic, strong) NSArray *shop;

//добавим изменяемый массив, который будет хранить товары

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //здесь будет выполняться основная логика
    
    //вначале читаем данные в массив
    [self readData];
    
    //затем отображаем эти данные 
    [self  showData];
    
    self.tableView.dataSource = self;
    
    //необходимо установить свойство delegate таблицы наш класс
    self.tableView.delegate = self;
}

//объявим метод для чтения данных из plist файла

-(void)readData {
    // получим путь к этому файлу
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Items" withExtension: @"plist"];
    
    // можем создать массив используя данные из plist файла
    self.shop = [NSArray arrayWithContentsOfURL:fileURL];
}

//объявление метода для отображения данных

-(void)showData {
    //сначала проверим структуру данных в нашем массиве
    NSLog(@"Data array %@", self.shop);
    
    //напишем логику для получения текстовых представлений каждого товара
    
    NSMutableArray *textRepresentation = [NSMutableArray array];
    
    //проиницианизируем массив товаров
    
    self.items = [[NSMutableArray alloc]init];

    for (NSDictionary *item in self.shop) {
         Item *itemObj = [[Item alloc] initWithDictionary:item];
        
    //теперь все объекты Item будем добавлять в массив items
        [self.items addObject:itemObj];
      
    //  CGFloat discount = MARKUP(<#cost#> floatValue, <#percent#>);
        
        if (itemObj.hasDiscount == YES) {
            //представление товара
            NSString *result = [itemObj itemDescription];
            [textRepresentation addObject:result];
        }

        
        
    }
    // далее формируем результирующую строку
    NSString *resultString = [textRepresentation componentsJoinedByString:@"\n\n"];
    
    // вывод результата
    self.resultLabel.text = resultString;

    }
        
#pragma mark - UITableViewDataSource - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //здесь нужно указать количество элементов в секции таблицы
    return self.items.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //здесь описываем визуальное представление данных в ячейках таблицы
    //введем переменную-идентификатор типа ячейки
    NSString *cellIdentifier = @"callIdentifier"; //имя типа проивольное
    //пробуем взять ячейку из очереди переиспользуемых чтобы не создавать ее
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //если ячеек в очерели нет, создаем ее
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    //добавим визуальное отображение данных, но сначала нужно установить наш класс как источник данных таблицы (стр - 42)
    
    //получим товар
    
    Item *item  = [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = [item itemDescription];
    
    // уберем подсветку выделенной ячейки
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//добавим реагирование на нажатие ячейки - этим занимается протокол UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //получаем выбранную ячейку
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.accessoryType = (cell.accessoryType == UITableViewCellAccessoryCheckmark) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
}

@end
