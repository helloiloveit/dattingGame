//
//  ConstantDefinition.h
//  Matchismo
//
//  Created by huyheo on 5/20/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//


#define DEBUG 1


#ifdef DEBUG
#	define DebugLog(format, ...) NSLog((@"<Debug>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	ifdef TRACE_LOG
#		define DebugTrace(format, ...) NSLog((@"<Trace>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	else
#		define DebugTrace(format, ...)
#	endif
#	define InfoLog(format, ...) NSLog((@"<Info> :%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	define WarningLog(format, ...) NSLog((@"<Warning>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	define ErrorLog(format, ...) NSLog((@"<Error>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#	define DebugLog(format, ...)
#	define DebugTrace(format, ...)
#	define InfoLog(format, ...) NSLog(@"<Info>: " format, ##__VA_ARGS__)
#	define WarningLog(format, ...) NSLog(@"<Warning>: " format, ##__VA_ARGS__)
#	define ErrorLog(format, ...) NSLog(@"<Error>: " format, ##__VA_ARGS__)
#endif




#   define URL_INFO @""

#define kCellHeight 50.0


#define TEXT_HEIGHT 150
#define TEXT_WIDTH  320

#define OUT_OF_SCREEN_POSITION_TOP -200
#define OUT_OF_SCREEN_POSITION_BOTTOM 800
#define HEADER_TEXT_POSITION  100
#define CONTENT_TEXT_POSITION  200
#define ABOUT_ME_TEXT_POSITION 400


//image blur
#define BLUR_DEGRE 200