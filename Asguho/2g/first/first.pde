// // •1. lav et program med en af disse (if , else if, for loop, while loop.) ekstra udfordring lav et program med if og en else if, eller et program med nested loops.
// for (int i = 0; i < 10; i++) {
//   println(i);
// }
// // •2. klasser og kontruktør (prøv lave en klasse med mere end en kontruktør.
// class Person {
//   String name;
//   int age;
//   Person(String name, int age) {
//     this.name = name;
//     this.age = age;
//   }
//   void prettyPrint() {
//     println("Name: " + name + ", Age: " + age);
//   }
// }
// Person p1 = new Person("John", 25);
// p1.prettyPrint();
// // •3. lav nogle eksempler med klasser og  metoder.
// class StringManipulator {
//   String toUpperCase(String str) {
//     return str.toUpperCase();
//   }
// }
// StringManipulator sm = new StringManipulator();
// println(sm.toUpperCase("hello world"));
// // •4. lav klasse hvor polyformi bruges.
static interface Printer {
  void print(String str);
}  

class ConsolePrinter implements Printer {
  void print(String str) {
    println(str);
  }
}
class FilePrinter implements Printer {
  void print(String str) {
    saveStrings("output.txt", new String[] { str });
  }
}
class PrinterManager {
  Printer printer;
  PrinterManager(Printer printer) {
    this.printer = printer;
  }
  void print(String str) {
    printer.print(str);
  }
}
PrinterManager pm = new PrinterManager(new ConsolePrinter());
pm.print("Hello World");
PrinterManager pm2 = new PrinterManager(new FilePrinter());
pm2.print("Hello World2");
// •5. Lav en eksempel hvor klasse med arv bruges.
// class Animal {
//     int age;
//     String name;

//     Animal(int age, String name) {
//         this.age = age;
//         this.name = name;
//     }
//     void print() {
//         println("Name: " + name + ", Age: " + age);
//     }
// }
// class Dog extends Animal {
//     Dog(int age, String name) {
//         super(age, name);
//     }
// }

// Dog dog = new Dog(5, "Rex");
// dog.print();