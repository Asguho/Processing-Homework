class Armor {
  String material;
  int defense;

  Armor(String material, int defense) {
    this.material = material;
    this.defense = defense;
  }

  void showStats() {
    println("Armor Material: " + material);
    println("Armor Defense: " + defense);
  }
}

class ArmorBuilder {
  String material;
  int defense;

  ArmorBuilder setMaterial(String material) {
    this.material = material;
    return this;
  }

  ArmorBuilder setDefense(int defense) {
    this.defense = defense;
    return this;
  }

  Armor build() {
    return new Armor(material, defense);
  }
}

abstract class ArmorDecorator extends Armor {
  Armor armor;

  ArmorDecorator(Armor armor) {
    super(armor.material, armor.defense);
    this.armor = armor;
  }

  abstract void showStats();
}

class UnbreackableEnchantment extends ArmorDecorator {
  UnbreackableEnchantment(Armor armor) {
    super(armor);
  }

  void showStats() {
    armor.showStats();
    println("Enchantment: Unbreakable");
  }
}

class FireResistanceEnchantment extends ArmorDecorator {
  FireResistanceEnchantment(Armor armor) {
    super(armor);
  }

  void showStats() {
    armor.showStats();
    println("Enchantment: Fire Resistance");
  }
}

void setup() {
  Armor ironArmor = new ArmorBuilder()
    .setMaterial("Iron")
    .setDefense(10)
    .build();

  println("\nIron armor:");
  ironArmor.showStats();



  Armor ironArmorWithUnbreakable = new UnbreackableEnchantment(ironArmor);
  Armor ironArmorWithFireResistAndUnbreakable = new FireResistanceEnchantment(ironArmorWithUnbreakable);

  println("\nEnchanted armor");
  ironArmorWithFireResistAndUnbreakable.showStats();

  exit();
}
