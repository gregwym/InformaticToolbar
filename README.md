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

## Screenshot

![Screenshot](https://f.cloud.github.com/assets/510089/1123211/417deee4-1aeb-11e3-93b0-338e7497abbd.png)

## Install

First of all, Copy / Drag&Drop `InformaticToolbar/InformaticToolbar/*` into your project.

## How to use

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

To add another kind of `ItemSet` is similar, please checkout the demo project.

## Demo Project

In the project, there is a demo app you can tryout. `ITViewController.m` includes the sample usage of all three pre-defined item sets.

## Credits

* [Greg Wang](https://github.com/gregwym)

## License

[The MIT License](http://opensource.org/licenses/MIT)

Copyright (c) 2012-2013 Greg Wang [http://gregwym.info/](http://gregwym.info/)
