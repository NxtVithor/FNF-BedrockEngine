package;

#if desktop
import Discord.DiscordClient;
#end

class Ratings
{

public static var ratingStuff:Array<Dynamic> =
[


     ["D", 0.401],
     ["C", 0.7],
     ["B", 0.8],
     ["A", 0.9],
     ["AA", 0.951],
     ["AAA", 0.976],
     ["S", 1],
     ["S+", 1]
     
];

public static var ratingComplex:Array<Dynamic> =
[

     ["D--", 0.2],
     ["D-", 0.3],
     ["D", 0.401],
     ["C-", 0.5],
     ["C", 0.6],
     ["C", 0.7],
     ["B", 0.8],
     ["A", 0.86],
     ["A.", 0.9],
     ["A:", 0.96],
     ["AA", 0.976],
     ["AA.", 0.981],
     ["AA:", 0.986],
     ["AAA", 0.991],
     ["AAA.", 0.9936],
     ["AAA:", 0.9959],
     ["AAAA", 0.998],
     ["AAAA.", 0.9989],
     ["AAAA:", 0.9998],
     ["S", 1],
     ["S+", 1]
     
         
];

public static var ratingSimple:Array<Dynamic> =
[
     ["What the fuck bro", 0.001], //%0
     ["Fuck...", 0.2], //%19
     ["Shit", 0.4], //%39
     ["So bad", 0.5], //%49
     ["Bad", 0.6], //%59
     ["Okay", 0.69], //%68
     ["Nice", 0.7], //%69
     ["Cool", 0.8],  //%79
     ["Sick", 0.9], //%89
     ["Great!", 1], //%99
     ["Excellent!", 1] //%100


];


}