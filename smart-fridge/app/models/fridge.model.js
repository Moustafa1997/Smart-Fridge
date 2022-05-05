exports.fridge = class fridge {
  constructor(
    productId,
    name,
    buyingDate,
    expiredDate,
    quantity,
    type,
    image,
    shelf
  ) {
    this.productId = productId;
    this.name = name;
    this.buyingDate = buyingDate;
    this.expiredDate = expiredDate;
    this.quantity = quantity;
    this.type = type;
    this.image = image;
    this.shelf = shelf;
  }
};
