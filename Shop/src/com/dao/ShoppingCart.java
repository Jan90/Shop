package com.dao;

import java.util.Vector;

public class ShoppingCart implements java.io.Serializable
{
	private static final long serialVersionUID = 1L;
	static int CARTID =1;

  protected Vector<CD> items;

  public ShoppingCart()
  {
      items = new Vector<CD>();
  }
 @SuppressWarnings("unchecked")
	public Vector<CD> getItems()
  {
      return (Vector<CD>) items.clone();
  }

  public void addItem(CD newItem)
  {
  		items.addElement(newItem);
  		return;
 }
}
