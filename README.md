#Praktik opgave til HouseOfCode
##Login app - Baseret på HOC Api

![alt-text-1](http://andersbchristensen.com/rsz_screenshot_438.jpg) ![alt-text-2](http://andersbchristensen.com/rsz_screenshot_439.jpg)

* Anders Butzbach Christensen, anders@chally.me


##Lav en app der kan logge ind igennem HouseOfCode Api
Appen logger ind igennem HouseOfCode api'en, og gemmer email og password i CoreData. Denne funktion bliver anvendt til at lave auto-login. Dvs. At man skal ikke logge ind og ud af appen hver gang man åbner for den. Den success response som api'en sender retur når man poster til server, bliver også gemt i CoreData og derfor skal man ikke hente hver gang. Dette gør appen meget mere brugervenlig og performance besparende. 

##Functionaliteter 

* CoreData
* SwiftyJSON - Til behandling af json.


##Udfald for brugerne
De undgår login hver eneste gang og kan derfor hurtigt komme ind i appen og bruge den. 

##Mangler
Man vil nok gøre det mere Objekt orienteret i fremtiden, med en evt response class og subcription class.


