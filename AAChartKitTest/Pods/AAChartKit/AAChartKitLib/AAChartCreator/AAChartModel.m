
//
//  AAChartModel.m
//  AAChartKit
//
//  Created by An An on 17/1/20.
//  Copyright ยฉ 2017ๅนด An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * ๐ ๐ ๐ ๐  โโโ   WARM TIPS!!!   โโโ ๐ ๐ ๐ ๐
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAChartModel.h"

AAChartType const AAChartTypeColumn          = @"column";
AAChartType const AAChartTypeBar             = @"bar";
AAChartType const AAChartTypeArea            = @"area";
AAChartType const AAChartTypeAreaspline      = @"areaspline";
AAChartType const AAChartTypeLine            = @"line";
AAChartType const AAChartTypeSpline          = @"spline";
AAChartType const AAChartTypeScatter         = @"scatter";
AAChartType const AAChartTypePie             = @"pie";
AAChartType const AAChartTypeBubble          = @"bubble";
AAChartType const AAChartTypePyramid         = @"pyramid";
AAChartType const AAChartTypeFunnel          = @"funnel";
AAChartType const AAChartTypeColumnrange     = @"columnrange";
AAChartType const AAChartTypeArearange       = @"arearange";
AAChartType const AAChartTypeAreasplinerange = @"areasplinerange";
AAChartType const AAChartTypeBoxplot         = @"boxplot";
AAChartType const AAChartTypeWaterfall       = @"waterfall";
AAChartType const AAChartTypePolygon         = @"polygon";
AAChartType const AAChartTypeErrorbar        = @"errorbar";
AAChartType const AAChartTypeGauge           = @"gauge";

AAChartLayoutType const AAChartLayoutTypeHorizontal = @"horizontal";
AAChartLayoutType const AAChartLayoutTypeVertical   = @"vertical";

AAChartAlignType const AAChartAlignTypeLeft   = @"left";
AAChartAlignType const AAChartAlignTypeCenter = @"center";
AAChartAlignType const AAChartAlignTypeRight  = @"right";

AAChartVerticalAlignType const AAChartVerticalAlignTypeTop    = @"top";
AAChartVerticalAlignType const AAChartVerticalAlignTypeMiddle = @"middle";
AAChartVerticalAlignType const AAChartVerticalAlignTypeBottom = @"bottom";

AAChartZoomType const AAChartZoomTypeNone = @"none";
AAChartZoomType const AAChartZoomTypeX    = @"x";
AAChartZoomType const AAChartZoomTypeY    = @"y";
AAChartZoomType const AAChartZoomTypeXY   = @"xy";

AAChartStackingType const AAChartStackingTypeFalse   = @"";
AAChartStackingType const AAChartStackingTypeNormal  = @"normal";
AAChartStackingType const AAChartStackingTypePercent = @"percent";

AAChartSymbolType const AAChartSymbolTypeCircle        = @"circle";
AAChartSymbolType const AAChartSymbolTypeSquare        = @"square";
AAChartSymbolType const AAChartSymbolTypeDiamond       = @"diamond";
AAChartSymbolType const AAChartSymbolTypeTriangle      = @"triangle";
AAChartSymbolType const AAChartSymbolTypeTriangle_down = @"triangle-down";

AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault     = @"default";
AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank  = @"innerBlank";
AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank = @"borderBlank";

AAChartFontWeightType const AAChartFontWeightTypeThin     = @"thin";
AAChartFontWeightType const AAChartFontWeightTypeRegular  = @"regular";
AAChartFontWeightType const AAChartFontWeightTypeBold     = @"bold";

AAChartLineDashStyleType const AAChartLineDashStyleTypeSolid           = @"Solid";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDash       = @"ShortDash";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDot        = @"ShortDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDashDot    = @"ShortDashDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeShortDashDotDot = @"ShortDashDotDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeDot             = @"Dot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeDash            = @"Dash";
AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDash        = @"LongDash";
AAChartLineDashStyleType const AAChartLineDashStyleTypeDashDot         = @"DashDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDashDot     = @"LongDashDot";
AAChartLineDashStyleType const AAChartLineDashStyleTypeLongDashDotDot  = @"LongDashDotDot";

@implementation AAChartModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _title                 = @"";
        _subtitle              = @"";
        _chartType             = AAChartTypeColumn;//้ป่ฎคๅพ่กจ็ฑปๅไธบๆฑ็ถๅพ
        _animationType         = AAChartAnimationLinear;//้ป่ฎคไฝฟ็จ้easing.jsไธญ็'linear'็บฟๆงๆธๅๆๆ
        _animationDuration     = @800;//้ป่ฎคๅจ็ปๆถ้ฟไธบ800ๆฏซ็ง
        _stacking              = AAChartStackingTypeFalse;//้ป่ฎคไธๅผๅฏๅพ่กจๆฐๆฎ็ๅ?็งฏๆๆ
        _zoomType              = AAChartZoomTypeNone ;//้ป่ฎค็ฆ็จๅพ่กจ็ๆๅฟ็ผฉๆพๅ่ฝ
        _colorsTheme           = @[@"#1e90ff",@"#ef476f",@"#ffd066",@"#04d69f",@"#25547c",];//้ป่ฎค้ข่ฒไธป้ข
        _tooltipEnabled        = YES;//้ป่ฎคๅฏ็จๆตฎๅจๆ็คบๆก
        _tooltipShared         = YES;//้ป่ฎคๅค็ปๆฐๆฎๅฑไบซไธไธชๆตฎๅจๆ็คบๆก
        _xAxisLabelsEnabled    = YES;//้ป่ฎคๆพ็คบ X่ฝดๅๆ?็นๆๅญ
        _xAxisVisible          = YES;//x่ฝด้ป่ฎคๅฏ่ง
        _yAxisTitle            = @"";
        _yAxisVisible          = YES;//y่ฝด้ป่ฎคๅฏ่ง
        _yAxisLabelsEnabled    = YES;
        _yAxisLineWidth        = @0.5; //y่ฝด่ฝด็บฟ็ๅฎฝๅบฆ
        _legendEnabled         = YES;//้ป่ฎคๆพ็คบๅพไพ(ๅพ่กจไธๆนๅฏ็นๅป็ๅธฆๆๆๅญ็ๅฐๅ็น)
        _borderRadius          = @0; //ๆฑ็ถๅพ้ฟๆกๅพๅคด้จๅ่งๅๅพ(ๅฏ็จไบ่ฎพ็ฝฎๅคด้จ็ๅฝข็ถ,ไปๅฏนๆกๅฝขๅพ,ๆฑ็ถๅพๆๆ,่ฎพ็ฝฎไธบ1000ๆถ,ๆฑๅฝขๅพๆ่ๆกๅฝขๅพๅคด้จไธบๆฅๅฝข)
        _markerRadius          = @5; //ๆ็บฟ่ฟๆฅ็น็ๅๅพ้ฟๅบฆ,ๅฆๆๅผ่ฎพ็ฝฎไธบ0,่ฟๆ?ทๅฐฑ็ธๅฝไบไธๆพ็คบไบ
        _yAxisAllowDecimals    = YES;//้ป่ฎคy่ฝดๅ่ฎธๆพ็คบๅฐๆฐ
    }
    return self;
}

AAPropSetFuncImplementation(AAChartModel, NSString *, title) //ๆ?้ขๅๅฎน
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, titleStyle) //ๆ?้ขๆๅญๆ?ทๅผ
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle) //ๅฏๆ?้ขๅๅฎน
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, subtitleStyle) //ๅฏๆ?้ขๆๅญๆ?ทๅผ
AAPropSetFuncImplementation(AAChartModel, AAChartAlignType, subtitleAlign) //ๅพ่กจๅฏๆ?้ขๆๆฌๆฐดๅนณๅฏน้ฝๆนๅผใๅฏ้็ๅผๆ โleftโ๏ผโcenterโๅโrightโใ ้ป่ฎคๆฏ๏ผcenter.
AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor) //ๅพ่กจ่ๆฏ่ฒ(ๅฟ้กปไธบๅๅญ่ฟๅถ็้ข่ฒ่ฒๅผๅฆ็บข่ฒ"#FF0000")
AAPropSetFuncImplementation(AAChartModel, NSArray  *, colorsTheme) //ๅพ่กจไธป้ข้ข่ฒๆฐ็ป
AAPropSetFuncImplementation(AAChartModel, NSArray     <NSString *>*, categories) //x่ฝดๅๆ?ๆฏไธช็นๅฏนๅบ็ๅ็งฐ(ๆณจๆ:่ฟไธชไธๆฏ็จๆฅ่ฎพ็ฝฎ X ่ฝด็ๅผ,ไปไปๆฏ็จไบ่ฎพ็ฝฎ X ่ฝดๆๅญๅๅฎน็่ๅทฒ)
AAPropSetFuncImplementation(AAChartModel, NSArray  *, series) //ๅพ่กจ็ๆฐๆฎๅๅๅฎน

AAPropSetFuncImplementation(AAChartModel, AAChartType,              chartType) //ๅพ่กจ็ฑปๅ
AAPropSetFuncImplementation(AAChartModel, AAChartStackingType,      stacking) //ๅ?็งฏๆ?ทๅผ
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolType,        markerSymbol) //ๆ็บฟๆฒ็บฟ่ฟๆฅ็น็็ฑปๅ๏ผ"circle", "square", "diamond", "triangle","triangle-down"๏ผ้ป่ฎคๆฏ"circle"
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolStyleType,   markerSymbolStyle)
AAPropSetFuncImplementation(AAChartModel, AAChartZoomType,          zoomType) //็ผฉๆพ็ฑปๅ AAChartZoomTypeX ่กจ็คบๅฏๆฒฟ็ x ่ฝด่ฟ่กๆๅฟ็ผฉๆพ
AAPropSetFuncImplementation(AAChartModel, AAChartAnimation,         animationType) //่ฎพ็ฝฎๅพ่กจ็ๆธฒๆๅจ็ป็ฑปๅ
AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration) //่ฎพ็ฝฎๅพ่กจ็ๆธฒๆๅจ็ปๆถ้ฟ(ๅจ็ปๅไฝไธบๆฏซ็ง)

AAPropSetFuncImplementation(AAChartModel, BOOL,       inverted) //x ่ฝดๆฏๅฆๅ็ด,้ป่ฎคไธบๅฆ
AAPropSetFuncImplementation(AAChartModel, BOOL,       polar) //ๆฏๅฆๆๅๅพๅฝข(ๅไธบ้ท่พพๅพ),้ป่ฎคไธบๅฆ

AAPropSetFuncImplementation(AAChartModel, BOOL,       dataLabelsEnabled) //ๆฏๅฆๆพ็คบๆฐๆฎ,้ป่ฎคไธบๅฆ
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, dataLabelsStyle)//dataLabels ๆๅญๆ?ทๅผ

AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisVisible) //x ่ฝดๆฏๅฆๅฏ่ง(้ป่ฎคๅฏ่ง)
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisReversed) // x ่ฝด็ฟป่ฝฌ,้ป่ฎคไธบๅฆ
AAPropSetFuncImplementation(AAChartModel, BOOL,       xAxisLabelsEnabled) //x ่ฝดๆฏๅฆๆพ็คบๆๅญ
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, xAxisLabelsStyle) //x ่ฝดๆๅญๆ?ทๅผ
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisTickInterval) //x่ฝดๅปๅบฆ็น้ด้ๆฐ(่ฎพ็ฝฎๆฏ้ๅ?ไธช็นๆพ็คบไธไธช X่ฝด็ๅๅฎน)
AAPropSetFuncImplementation(AAChartModel, AALineStyle *, xAxisGridLineStyle) //x ่ฝด็ฝๆ?ผ็บฟ็ๆ?ทๅผ
AAPropSetFuncImplementation(AAChartModel, AACrosshair *, xAxisCrosshair)

AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisVisible) //y ่ฝดๆฏๅฆๅฏ่ง(้ป่ฎคๅฏ่ง)
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisReversed) //y ่ฝด็ฟป่ฝฌ,้ป่ฎคไธบๅฆ
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisLabelsEnabled) //y ่ฝดๆฏๅฆๆพ็คบๆๅญ
AAPropSetFuncImplementation(AAChartModel, AAStyle  *, yAxisLabelsStyle)//y ่ฝดๆๅญๆ?ทๅผ
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle) //y ่ฝดๆ?้ข
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisLineWidth) //y y-axis line width
AAPropSetFuncImplementation(AAChartModel, BOOL,       yAxisAllowDecimals) //ๆฏๅฆๅ่ฎธ y ่ฝดๆพ็คบๅฐๆฐ
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisPlotLines) //y ่ฝดๆ?็คบ็บฟ๐งถ็้็ฝฎ
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMax) //y ่ฝดๆๅคงๅผ
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisMin) //y ่ฝดๆๅฐๅผ๏ผ่ฎพ็ฝฎไธบ0ๅฐฑไธไผๆ่ดๆฐ๏ผ
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisTickInterval)
AAPropSetFuncImplementation(AAChartModel, NSArray  *, yAxisTickPositions) //่ชๅฎไน y ่ฝดๅๆ?๏ผๅฆ๏ผ[@(0), @(25), @(50), @(75) , (100)]๏ผ
AAPropSetFuncImplementation(AAChartModel, AALineStyle *, yAxisGridLineStyle) //y ่ฝด็ฝๆ?ผ็บฟ็ๆ?ทๅผ
AAPropSetFuncImplementation(AAChartModel, AACrosshair *, yAxisCrosshair)

AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipEnabled) //ๆฏๅฆๆพ็คบๆตฎๅจๆ็คบๆก(้ป่ฎคๆพ็คบ)
AAPropSetFuncImplementation(AAChartModel, BOOL,       tooltipShared)//ๆฏๅฆๅค็ปๆฐๆฎๅฑไบซไธไธชๆตฎๅจๆ็คบๆก
AAPropSetFuncImplementation(AAChartModel, NSString *, tooltipValueSuffix) //ๆตฎๅจๆ็คบๆกๅไฝๅ็ผ

AAPropSetFuncImplementation(AAChartModel, BOOL,       connectNulls) //่ฎพ็ฝฎๆ็บฟๆฏๅฆๆญ็น้่ฟ(ๆฏๅฆ่ฟๆฅ็ฉบๅผ็น)
AAPropSetFuncImplementation(AAChartModel, BOOL,       legendEnabled) //ๆฏๅฆๆพ็คบๅพไพ lengend(ๅพ่กจๅบ้จๅฏ็นๆ็ๅ็นๅๆๅญ)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius) //ๆฑ็ถๅพ้ฟๆกๅพๅคด้จๅ่งๅๅพ(ๅฏ็จไบ่ฎพ็ฝฎๅคด้จ็ๅฝข็ถ,ไปๅฏนๆกๅฝขๅพ,ๆฑ็ถๅพๆๆ)
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius) //ๆ็บฟ่ฟๆฅ็น็ๅๅพ้ฟๅบฆ
AAPropSetFuncImplementation(AAChartModel, AAScrollablePlotArea *, scrollablePlotArea)

@end
