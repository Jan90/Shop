package com.dao;
import java.io.*;

public class CD implements Serializable {

	private static final long serialVersionUID = 1L;
	String cd_name;
	String cd_type;
	String cd_genre;

  public CD() {
    cd_name="";
    cd_type="";
    cd_genre="";
  }

  public CD(String cdName, String cdType, String cdGenre)
    {
  	 cd_name=cdName;
     cd_type=cdType;
     cd_genre=cdGenre;
    }
  public void setName(String name) {
    cd_name=name;
  }
  public String getName() {
    return cd_name;
  }
  public void setType(String type) {
	  cd_type=type;
  }
  public String getType() {
    return cd_type;
  }
  public void setGenre(String genre) {
	  cd_genre=genre;
  }
  public String getGenre() {
    return cd_genre;
  }
  
}
