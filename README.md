# CommonCodeSwift
Swift common extensions in Xcode 8.3.2
CommonoCdeSwift have Classextensions and Extension.
ClassExtension is use for StoryBoard And by Instance of class and Extensions is directly use by Class Name.
  * [UIImageViewExtension](#uiimageviewextension)  
  * [UIImageExtension](#uiimageextension)
  * [UILabelExtension](#uilabelextension)
  * [UIButtonExtension](#uibuttonextension)
  * [UICollectionViewExtension](#uicollectionviewextension)
  * [UITableViewExtension](#uitableviewextension)
  * [UITextFieldExtension](#uitextfieldextension)
  * [UITextViewExtension](#uitextviewextension)
  * [UIViewExtension](#uiviewextension)
  * [DateExtension](#dateextension) (InProgress...)
  * [StringExtended](#stringextended) (InProgress...)
  * [NSMutableAttribuedString](#nsmutableattribuedstring)
  * [AGDatePicker](#agdatepicker) (Now it wanna be more updates...)
  * [UINaviagtionExtension](#uinaviagtionextension) (InProgress...)
  etc.(InProgress).
  
### UIImageViewExtension
UIImageViewExtension use directly by storyboard and it have diffrent functionality like:
* Make circle
* Corner circle
* Directly make cirle
* Border width 
* Border color

<p>For Using This Class directly inherit it into storyboard UIImageView And Other extsions class also use as same:<p>

![Example](https://github.com/aman19ish/CommonCodeSwift/blob/master/ExampleImages/UIImageViewExtensionInherit.png)

## UIImageExtension
UIImageExtension fetaures have:
* ##### Compress Image #####
      let compressImage = image?.compressImage(image: image!, targetSize: CGSize.init(width: 200, height: 200), compressionQuality: 0.50)
* ##### Fix Image Orientation #####
      image?.fixOrientation()
      
## UILabelExtension
UILabelExtesion features have:
* Corner radius
* Border width
* Border color

## UIButtonExtension
UIBUttonExtension features have:
* Add sublayer on button driectly by storyboard
  * SublayerBorderWidth
  * SublayerBorderColorSelected
  * SublayerBorderColorNormal
  * LeftSublayer
  * RightSublayer
  * BottomSublayer
  * TopSublayer
* Corner Radius
* Directly make circle
* Border width
* Border color
* Shadow radius 
* Shadow color

## UICollectionViewExtension
UICollectionView Extension Have a single function which is use for get the cell identifier name, but condition is that class name and cell identifire name must be same.
- Syntax :- UICollectionViewCell.getCellIdentifier()

## UITableViewExtension
UITableVIew Extension also have a single function which is use for get the cell identifier name, but cell identifier name must be same as class name.
- Syntax :- UITableViewCell.getCellIdentifier()

## UITextFieldExtension
UITextFieldExtension features have:
* PlaceHolder Color
* Border Width
* Border Color
* LeftPaddingWidth
* LeftPaddingViewImage
* LeftPaddingText
* RightPaddingViewImage

## UITextViewExtension
UITextViewExtension features have:
* Border Width
* Border Color

## UIViewExtension
UIViewExtension features have:
* BorderWidth
* BorderColor
* CornerRadius
* MakeCircle
* AsPerWidthMakeCircle

## DateExtension
## StringExtended
## NSMutableAttribuedString
## AGDatePicker
## UINaviagtionExtension


<p>Example:<p>

![Example](https://github.com/aman19ish/CommonCodeSwift/blob/master/ExampleImages/DeviceExample.png)

# LICENSE

<p>Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.<p>
