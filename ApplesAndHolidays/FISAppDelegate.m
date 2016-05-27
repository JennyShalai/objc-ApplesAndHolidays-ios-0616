//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    ////if passing fruit is an apple, put it into basket (array);
    NSPredicate *appleFilterPredicate = [NSPredicate predicateWithFormat:@"self MATCHES[c] 'apple'"];
    NSArray *filteredFruits = [fruits filteredArrayUsingPredicate:appleFilterPredicate];
    return filteredFruits;
    
    
/* 2nd way to do the same - "old school" one;
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
     NSMutableArray *appleArray = [NSMutableArray new];
     for (NSString *fruit in fruits) {
        if ([fruit isEqualToString:@"apple"]) {
            [appleArray addObject:fruit];
        }
   }
 return appleArray;
}
 */
    
}



/*
 
suppliesBySeasonAndHoliday = @{ @"Winter" : [@{ @"Christmas Day"    : [@[ @"plastic tree"   ,
                                                                          @"tinsel"       ,
                                                                          @"lights"       ,
                                                                          @"presents"     ,
                                                                          @"wreath"       ,
                                                                          @"mistletoe"    ,
                                                                          @"Christmas music"
                                                                      ] mutableCopy],
 
                                                @"New Year's Day"   : [@[ @"party hats"   ,
                                                                          @"kazoos"       ,
                                                                          @"champagne"
                                                                      ] mutableCopy]
                                              } mutableCopy],
 
                                @"Spring" : [@{ @"Memorial Day"     : [@[ @"American flag",
                                                                       @"memoirs"
                                                                      ] mutableCopy]
                                              } mutableCopy],
 
                                @"Summer" : [@{ @"Independence Day" : [@[ @"fireworks"    ,
                                                                          @"barbeque"     ,
                                                                          @"picnic blanket",
                                                                          @"sunscreen"
                                                                      ] mutableCopy],
 
                                                @"Labor Day"        : [@[ @"white jeans"  ,
                                                                          @"shopping bag"
                                                                      ] mutableCopy]
                                              } mutableCopy],
 
                                @"Fall"   : [@{ @"Veteran's Day"    : [@[ @"barbeque"     ,
                                                                          @"American flag"
                                                                      ] mutableCopy],
 
                                                @"Thanksgiving Day" : [@[ @"turkey"       ,
                                                                          @"gravy"        ,
                                                                          @"mashed potatoes",
                                                                          @"acorn squash" ,
                                                                          @"cranberry sauce",
                                                                          @"napkins"
                                                                      ] mutableCopy]
                                              } mutableCopy]
                                };
*/

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    // all holidays in current season
    NSMutableArray *holidaysInSeason = [[NSMutableArray alloc] init];
    holidaysInSeason = database[season];
    return holidaysInSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    // all supplies of the given holiday
    NSMutableArray *suppliesInHoliday = [[NSMutableArray alloc] init];
    suppliesInHoliday = database[season][holiday];
    return suppliesInHoliday;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    // is given holiday celebrated in given season?
    BOOL isHolidayInSeason = NO;
    NSDictionary *holidaysInSeason = database[season];
    NSArray *holidays = [holidaysInSeason allKeys];
    if ([holidays containsObject:holiday]) {
        isHolidayInSeason = YES;
    }
    return isHolidayInSeason;
}

-(BOOL)supply:(NSString *)supply isInHoliday:( NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    // is there a given supply in given holiday?
    BOOL isSupplyInHoliday = NO;
    NSArray * suppliesInHoliday = database[season][holiday];
    if ([suppliesInHoliday containsObject:supply]) {
        isSupplyInHoliday = YES;
    }
    return isSupplyInHoliday;
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    //
    database[season][holiday] = [[NSMutableArray alloc] init];
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    // add supply to holiday by season
    NSMutableArray *allSupplies =[[NSMutableArray alloc] init];
    allSupplies = database[season][holiday];
    [allSupplies addObject:supply];
    return database;
}

@end