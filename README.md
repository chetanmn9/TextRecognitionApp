# Text Recognition App

Image Text Recognition Demo | 
------------ | 
![](https://github.com/chetanmn9/TextRecognitionApp/blob/master/RecieptReader/App%20Demo/TextRecognition.gif) |

Google Image Text Recognition App, uses Google’s Firebase ML Vision Kit to recognise the text in an image on a device. Firebase ML Vision, ML Text Model and Core are installed using Cocoapods.
The App’s initial view consists of an image picker button, text recogniser button and an image view to display the picked image.
*	Image is picked for text recognition. When the pick image button is tapped, the app opens the device camera to select an image.
*	When View did load, the on-device text recogniser function that is part of the ML Vision Library is called (this can be implemented on the google cloud as well).
*	The text recogniser button passes the image as Firebase Vision Image to the on-device text recogniser to process image, returns the text detected in the image.
*	The text is processed as a block in a feature, lines in a block or elements in a line, that is displayed to the user on a navigation screen.
