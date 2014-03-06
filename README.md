UIView-AutoYPositioning
=======================

A simple way to stack dynamic UIView. 


![Exemple](http://romito.fr/public/images/UIView+AutoYPositioning.jpg)


**RULES**
___
   
- DO NOT FORGET INTEGER BETWEEN TWO YIndex
i.e : v1.YIndex = 0, v2.YIndex = 1, v3.YIndex = 2 (And not 10 or 99 or more) 

- START THE YIndex from 0 to 100(maximum)

- DO NOT TAG A VIEW YOU WANT POSITIONED
    

**USAGE**
___

1 - import the Categorie

    #import "UIView+AutoYPositioning.h"
    

1 - Add views you want to stack and set the yIndex of them (respecting the rules just above)

    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, 30)];
    v1.backgroundColor = [UIColor redColor];
    [v1 setYIndex:0];
    [self.view addSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, 30)];
    v2.backgroundColor = [UIColor redColor];
    [v2 setYIndex:1];
    [self.view addSubview:v1];
    
2 - Use the static method to stack the views

    [UIView autoPositioningInContainer:self.view resized:YES withTopMargin:5];
    
     

