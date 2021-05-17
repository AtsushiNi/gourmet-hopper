package org.javatraining.action;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class UploadAction extends Action {

  @Override
  protected String processRequest(HttpServletRequest request) {
    try {
      Part filePart = request.getPart("file");
      InputStream fileContent = filePart.getInputStream();
      byte[] byteArray = getByteArray(fileContent);
      String base64String = Base64.getEncoder().encodeToString(byteArray);

      System.out.println("filePart: " + filePart);
      System.out.println("fileContent: " + fileContent);
      System.out.println("byteArray: " + byteArray);
      System.out.println("base64String: " + base64String);

      request.setAttribute("image", base64String);
    } catch (Exception e) {}
    return "uploaded.jsp";
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