# InformaticToolbar: iOS Toolbar Enhancement Library

Remember in the Mail App, it shows update status and sending mail progress in the bottom toolbar. I think it is a really neat way to show information, especially for those apps who use native iOS UI elements. 

However, I couldn't find any lib out there for this task. So I decide to invent the wheel myself. 

Feel free to post any issues or patch. It's my pleasure for any who like my work. 

## What it does

InformaticToolbar is mainly an UIViewController Category which allows you to add several ___UIBarButtonItem___s set to your toolbar. 

The sets are defined as subclasses of ___ITBarItemSet___. All ___ITBarItemSet___ can have a ___dismiss button___ if the target and action has been defined. If more than one set has been added, a ___switch button___ (an arrow) will be displayed on the left for user to switch between sets. 

For now, there are three pre-defined set: 

- ___ITLabelBarItemSet___: a textLabel and a detailTextLabel
- ___ITProgressBarItemSet___: a textLabel and a progressBar
- ___ITConfirmationBarItemSet___: two label and a check-mark button

You can easily create new sets by extending ___ITBarItemSet___ yourself. 

__Screenshot: __
![Screenshot](https://github.com/downloads/gregwym/InformaticToolbar/InformaticToolbar)

## How to use

### First: clone it to your project directory

```
cd *your-project-location*
git submodule add git://github.com/gregwym/InformaticToolbar.git
```
### Second: add to your project

You can either add the source codes directly or 

- drag and drop `InformaticToolbar.xcodeproj` to your project. 
- In your project setting
    - In __Build Phases->Target Dependencies__, add `InformaticToolbar` (the library)
    - In __Build Phases->Link Binary With Libraries__, add `libInformaticToolbar.a`
    - In __Build Settings__, add `"${PROJECT_DIR}/InformaticToolbar/"` to __User Header Search Paths__, include the quotation marks. 
    - In __Build Settings__, set __Always Search User Path__ to `YES`
    - In __Build Settings__, set __Other Linker Flags__ to `-ObjC`

### Third: add the header

In any `UIViewController` that you want to use this lib, add `#import "InformaticToolbar.h"` at the front. 

Or easier, you can add the import to YOUR `Prefix.pch` file.

### Forth: add an item set to toolbar

Let's say I want to add a Label to my toolbar, I can call the following method in an `UIViewController`: 

```
- (IBAction)addLabelBarItemSet:(id)sender
{
	ITLabelBarItemSet *labelBarItemSet = [ITLabelBarItemSet labelBarItemSetWithDismissTarget:self andAction:@selector(dismissBarItemSet:)];
	labelBarItemSet.textLabel.text = @"This is text label. ";
	labelBarItemSet.detailTextLabel.text = @"This is detail text label. ";
	[self pushBarItemSet:labelBarItemSet animated:YES];
}

- (void)dismissBarItemSet:(ITBarItemSet *)sender
{
	[self removeBarItemSet:sender animated:YES];
}
```

## Demo Project

In the project, there is a demo app you can tryout. `ITViewController.m` includes the sample usage of all three pre-defined item sets. 

## License

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/)

InformaticToolbar by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/gregwym/InformaticToolbar" property="cc:attributionName" rel="cc:attributionURL">Greg Wang</a> is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).