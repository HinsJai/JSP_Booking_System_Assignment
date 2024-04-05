package ict.itp4511_assignment.servlet;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/6 - 04 - 06 - 上午 12:05
 * @Description: ict.itp4511_assignment.servlet
 * @version: 1.0
 */


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "UploadController", urlPatterns = "/UploadServlet")
public class UploadController extends HttpServlet {
    private static final long serialVersionUID = 1L;


//    private static final String UPLOAD_DIRECTORY = "upload";


    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 10; // 10MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 100; // 100MB

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login?success=false");
            return;
        }

        DiskFileItemFactory factory = new DiskFileItemFactory();

        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // set temp dir
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);


        upload.setFileSizeMax(MAX_FILE_SIZE);


        upload.setSizeMax(MAX_REQUEST_SIZE);

        upload.setHeaderEncoding("UTF-8");

//        String uploadPath = getServletContext().getRealPath("/") + "images\\equipment";
        String uploadPath = "C:\\Users\\jason\\Desktop\\ITP4511_Assignment\\ITP4511_Assignment\\src\\main\\webapp\\images\\equipment";

        // create dir if not exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        switch (action) {
            case "addToTempFileList":
                addToTempFileList(request, response, upload);
                break;
            case "uploadFileList":
                uploadFileList(request, response, uploadPath);
                break;
            case "removeFile":
                String imageID = request.getParameter("imageID");
                removeFromTempFileList(request, response, imageID);
                break;
            default:
                response.sendRedirect("login?success=false");
        }


    }

//    public void uploadFileList(HttpServletRequest request, HttpServletResponse response, ServletFileUpload upload, String uploadPath) {
//        try {
//            HttpSession session = request.getSession(false);
//            if (session == null) {
//                response.sendRedirect("login?success=false");
//                return;
//            }
//            ArrayList<List<FileItem>> tempFileList = (ArrayList<List<FileItem>>) session.getAttribute("tempFileList");
//            for (List<FileItem> formItems : tempFileList) {
//                for (FileItem item : formItems) {
//                    if (!item.isFormField()) {
//                        String fileName = new File(item.getName()).getName();
//                        String filePath = uploadPath + File.separator + fileName;
//                        File storeFile = new File(filePath);
//                        // 保存文件到硬盘
//                        item.write(storeFile);
//                    }
//                }
//            }
//            session.removeAttribute("tempFileList");
//            response.sendRedirect("equipment?action=list");
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }

//    public void uploadFileList(HttpServletRequest request, HttpServletResponse response, String uploadPath) {
//        try {
//            HttpSession session = request.getSession(false);
//            if (session == null) {
//                response.sendRedirect("login?success=false");
//                return;
//            }
//
//            // Retrieve the list of FileItem objects from the session
//            List<FileItem> tempFileList = (List<FileItem>) session.getAttribute("tempFileList");
//            if (tempFileList != null) {
//                for (FileItem item : tempFileList) {
//                    // Process only the items that are not form fields
//                    if (!item.isFormField()) {
//                        String fileName = new File(item.getName()).getName();
//                        String filePath = uploadPath + File.separator + fileName;
//                        File storeFile = new File(filePath);
//                        // Save the file to disk
//                        item.write(storeFile);
//                    }
//                }
//                // Remove the attribute from the session after processing
//                session.removeAttribute("tempFileList");
////                response.sendRedirect("equipment?action=list");
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }

//    public void addToTempFileList(HttpServletRequest request, HttpServletResponse response, ServletFileUpload upload) {
//        try {
//            HttpSession session = request.getSession(false);
//            if (session == null) {
//                response.sendRedirect("login?success=false");
//                return;
//            }
//
//            String imageID = request.getParameter("imageID");
//            List<FileItem> formItems = upload.parseRequest(request);
//            if (session.getAttribute("tempFileList") == null) {
//                session.setAttribute("tempFileList", formItems);
//            } else {
//
//                List<FileItem> tempFileList = (List<FileItem>) session.getAttribute("tempFileList");
//                tempFileList.addAll(formItems);
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }

    public void uploadFileList(HttpServletRequest request, HttpServletResponse response, String uploadPath) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login?success=false");
                return;
            }

            // Retrieve the map of FileItem lists from the session
            Map<String, List<FileItem>> tempFileMap = (Map<String, List<FileItem>>) session.getAttribute("tempFileMap");
            if (tempFileMap != null) {
                // Iterate over the map entries
                for (Map.Entry<String, List<FileItem>> entry : tempFileMap.entrySet()) {
                    String imageID = entry.getKey(); // This is the image ID
                    List<FileItem> fileList = entry.getValue();

                    for (FileItem item : fileList) {
                        // Process only the items that are not form fields
                        if (!item.isFormField()) {
                            // Use imageID for the file name instead of the original file name
                            String fileName = imageID + ".jpg";
                            String filePath = uploadPath + File.separator + fileName;
                            File storeFile = new File(filePath);
                            // Save the file to disk
                            item.write(storeFile);
                        }
                    }
                }
                // Remove the attribute from the session after processing
                session.removeAttribute("tempFileMap");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void addToTempFileList(HttpServletRequest request, HttpServletResponse response, ServletFileUpload upload) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login?success=false");
                return;
            }

            String imageID = request.getParameter("imageID");
            List<FileItem> formItems = upload.parseRequest(request);

            // Retrieve the map from the session or create a new one if it doesn't exist
            Map<String, List<FileItem>> tempFileMap = (Map<String, List<FileItem>>) session.getAttribute("tempFileMap");
            if (tempFileMap == null) {
                tempFileMap = new HashMap<>();
            }

            // Add the new formItems to the map using the imageID as the key
            // If the key already exists, it appends the new items to the existing list
            List<FileItem> existingItems = tempFileMap.getOrDefault(imageID, new ArrayList<>());
            existingItems.addAll(formItems);
            tempFileMap.put(imageID, existingItems);

            // Update the session attribute with the new map
            session.setAttribute("tempFileMap", tempFileMap);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void removeFromTempFileList(HttpServletRequest request, HttpServletResponse response, String imageID) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login?success=false");
                return;
            }

            Map<String, List<FileItem>> tempFileMap = (Map<String, List<FileItem>>) session.getAttribute("tempFileMap");
            if (tempFileMap != null) {
                // Remove the entry associated with the given image ID
                tempFileMap.remove(imageID);

                session.setAttribute("tempFileMap", tempFileMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public void addToTempFileList(HttpServletRequest request, HttpServletResponse response, ServletFileUpload upload) {
//        try {
//            HttpSession session = request.getSession(false);
//            if (session == null) {
//                response.sendRedirect("login?success=false");
//                return;
//            }
//            List<FileItem> formItems = upload.parseRequest(request);
//            if (session.getAttribute("tempFileList") == null) {
//                ArrayList<List<FileItem>> tempFileList = new ArrayList<>();
//                tempFileList.add(formItems);
//                session.setAttribute("tempFileList", tempFileList);
//            } else {
//                ArrayList<List<FileItem>> tempFileList = (ArrayList<List<FileItem>>) session.getAttribute("tempFileList");
//                tempFileList.add(formItems);
//                session.setAttribute("tempFileList", tempFileList);
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }
}

