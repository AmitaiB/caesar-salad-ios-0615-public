//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here
-(NSString*)encodeWithMessage:(NSString*)message andOffset:(NSInteger)key {
    NSCharacterSet *charsToIgnore = [NSCharacterSet letterCharacterSet];
    NSCharacterSet *upperCaseLetters = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *lowerCaseLetters = [NSCharacterSet lowercaseLetterCharacterSet];
    
    
    NSMutableString *workingMessage = [NSMutableString stringWithString:message];
    for (NSInteger i = 0; i < workingMessage.length; i++) {
        NSInteger workingASCIIChar = [workingMessage characterAtIndex:i];
        BOOL isUppercase = NO;
//        BOOL isLowercase = NO;
        
        if ([[charsToIgnore characterIsMember: workingASCIIChar])
             continue;
        else if ([[charsToIgnore characterIsMember: workingASCIIChar])
             
             workingASCIIChar += 3;
    
             
        
        
    }
    
    return @"";
}



-(NSString *)decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)key {
    return [self encodeWithMessage:encodedMessage andOffset:(-1* key)];
}


@end
