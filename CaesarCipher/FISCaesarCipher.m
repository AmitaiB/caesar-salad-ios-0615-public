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
    
    //All multiples of 26 come "full-circle" around the alphabet. We get rid of them to simplify the problem.
    NSInteger modKey = key % 26;
    
    NSMutableString *workingMessage = [NSMutableString stringWithString:message];
    
    for (NSInteger i = 0; i < workingMessage.length; i++) {
        NSInteger workingASCIIChar = [workingMessage characterAtIndex:i];
        if ([charsToIgnore characterIsMember: workingASCIIChar])
            continue;
        
        BOOL isUppercase = NO;
        if ([upperCaseLetters characterIsMember: workingASCIIChar])
            isUppercase = YES;
        BOOL isLowercase = !isUppercase;
//        BOOL isLowercase = NO;
        workingASCIIChar += modKey; //the actual encoding
        
//        word-wrapping (z + 3 --> c)
        if ((isUppercase && workingASCIIChar > 90) ||
            (isLowercase && workingASCIIChar > 122))
                workingASCIIChar -= 26;
        else if ((isUppercase && workingASCIIChar < 65) ||
                 (isLowercase && workingASCIIChar < 97))
                workingASCIIChar += 26;
        
        workingMessage[i] = [[NSString stringWithFormat:@"%C", (unichar)workingASCIIChar]mutableCopy];
    } //closes for-loop
    
    return @"";
}



-(NSString *)decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)key {
    return [self encodeWithMessage:encodedMessage andOffset:(-1* key)];
}


@end
