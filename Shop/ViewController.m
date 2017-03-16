//
//  ViewController.m
//  Shop
//
//  Created by Аурика Сарева on 12.03.17.
//  Copyright © 2017 Marika Marika. All rights reserved.
//
#import "items.h"
#import "ViewController.h"
#define MARKUP(cost, percent) (cost * percent)

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
        NSString *title = [item objectForKey:@"title"];
        NSNumber *cost = [item objectForKey:@"cost"];
        NSNumber *availableNumber = [item objectForKey:@"availableNumber"];
        NSString *manufacturer = [item objectForKey:@"manufacture"];
        BOOL Discount  = [[item objectForKey:@"hasDiscount"] boolValue];
        NSDateFormatter *DateOfManufacture= [item objectForKey:@"DateOfManufacture"];
        
      
      //  CGFloat discount = MARKUP(<#cost#> floatValue, <#percent#>);
        
        if (Discount == YES) {
            //представление товара
            NSString *result =
                [NSString stringWithFormat:@"Title - %@, cost - %@, available number - %@, manufacturer - %@, has discount -  %s, Date of manufacture - %@, MARKUP - %.2f",
                    title,
                    cost,
                    availableNumber,
                    manufacturer,
                    (Discount == 1 ? "yes" : "no"),
                    DateOfManufacture,
                    MARKUP([cost intValue], 1.2)];

            [textRepresentation addObject:result];
        }

        
        
    }
    // далее формируем результирующую строку
    NSString *resultString = [textRepresentation componentsJoinedByString:@"\n\n"];
    
    // вывод результата
    self.resultLabel.text = resultString;

    }
        



@end
