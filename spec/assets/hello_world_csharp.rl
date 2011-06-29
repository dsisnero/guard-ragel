%%{
  machine hello;
  expr = 'h';
  main := expr @ { Console.Out.WriteLine("greetings!"); } ;
}%%
 
 using System;
 
 namespace Mab.Test
 {
   public class Hello
   {
 %% write data;
     public static void Main(string [] args)
     {
       foreach(var arg in args)
       {
         Console.WriteLine("***** " + arg + " ******");
         Run(arg);
       }
     }
 
     private static void Run(String data)
     {
       int cs;
       int p = 0;
       int pe = data.Length;
       // init:
       %% write init;
       // exec:
       %% write exec;
     }
   }
 }
