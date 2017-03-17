//
//  ViewController.m
//  Shop
//
//  Created by Аурика Сарева on 12.03.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//
#import "item.h"
#import "ViewController.h"

@interface ViewController ()

//объявляем свойство класса для хранения информации о наших товарах
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic, strong) NSArray *shop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //здесь будет выполняться основная логика
    
    //вначале читаем данные в массив
    [self readData];
    
    //затем отображаем эти данные 
    [self  showData];
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

    for (NSDictionary *item in self.shop) {
         Item *itemObj = [[Item alloc] initWithDictionary:item];
      
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
        



@end
