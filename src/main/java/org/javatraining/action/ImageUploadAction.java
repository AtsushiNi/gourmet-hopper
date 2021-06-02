package org.javatraining.action;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class ImageUploadAction extends Action {

  @Override
  protected String processRequest(HttpServletRequest request) {
    try {
      
      System.out.println("[ImageUploadAction.java]: Start");
    	
      Part filePart = request.getPart("file");
      InputStream fileContent = filePart.getInputStream();
      byte[] byteArray = getByteArray(fileContent);
      String base64String = Base64.getEncoder().encodeToString(byteArray);

      System.out.println("[ImageUploadAction.java]: filePart: " + filePart);
      System.out.println("[ImageUploadAction.java]: fileContent: " + fileContent);
      System.out.println("[ImageUploadAction.java]: byteArray: " + byteArray);
      System.out.println("[ImageUploadAction.java]: base64String: " + base64String);

      request.setAttribute("image", base64String);
    } catch (Exception e) {}

    System.out.println("[ImageUploadAction.java]: End");    
    return "imageuploaded.jsp";
  }

  private static byte[] getByteArray(InputStream is) throws Exception {
    ByteArrayOutputStream b = new ByteArrayOutputStream();
    BufferedOutputStream os = new BufferedOutputStream(b);
    while (true) {
      int i = is.read();
      if (i == -1) break;
      os.write(i);
    }
    os.flush();
    os.close();
    return b.toByteArray();
  }
}