<%@page import="org.apache.catalina.tribes.group.interceptors.TwoPhaseCommitInterceptor.MapEntry"%>
<%@page import="org.apache.tomcat.jni.Directory"%>
<%@page import="com.matisse.MtDatabase"%>
<%@ page import = "java.lang.String,java.io.File,java.sql.*, javax.servlet.*,one.one, org.apache.tomcat.util.http.fileupload.servlet.*, java.util.*, org.apache.tomcat.util.http.fileupload.*, org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>

<%
// Create a new database class
one con = new one(); 
Statement stm = con.getStatement();

Map<String, String> formValues = new HashMap<String, String>();
File file; 
String imageFile = ""; 
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (isMultipart)
{
    try 
    {
    	FileItemFactory factory = new DiskFileItemFactory();
    	ServletFileUpload upload = new ServletFileUpload(factory);
        List items = upload.parseRequest(new ServletRequestContext(request));
        Iterator iterator = items.iterator();
        while (iterator.hasNext()) 
        {
            FileItem item = (FileItem) iterator.next();

            if (item.isFormField()) //your code for getting form fields
            {
                String name = item.getFieldName();
                String value = item.getString();
               	formValues.put(name, value);
            }

            if (!item.isFormField()) 
            {
	            // Get the uploaded file parameters
	            String fieldName = item.getFieldName();
	            String fileName = item.getName();
	            
	            boolean isInMemory = item.isInMemory();
	            long sizeInBytes = item.getSize();
	         	String filePath = getServletContext().getRealPath("/") + "admin\\Images";
	         	//out.println(filePath);
	         	
	         	
	         	// Name of the image file
	         	imageFile = fileName.substring(fileName.lastIndexOf("\\")+1);
	       	
	         	
	         	
	         	
	         	// Write the file
	            if( fileName.lastIndexOf("\\") >= 0 ) {
	               file = new File( filePath + 
	               fileName.substring( fileName.lastIndexOf("\\"))) ;
	            } else {
	               file = new File( filePath + 
	               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	            }
	         	
	         	// Upload the file
	            item.write( file ) ;
	            
                 
            }
        }
      
       String query = "INSERT INTO auction_items VALUES ('"+formValues.get("name")+"', '"+formValues.get("date")+"', '"+formValues.get("category")+"', '"+formValues.get("medium")+"', '"+formValues.get("frame")+"', '"+formValues.get("dimensions")+"', '"+formValues.get("description")+"', '"+formValues.get("price")+"', '"+imageFile+"', '"+formValues.get("weight")+"')"; 
       stm.executeQuery(query);
       
       con.closeConnection();  
        
    }
    catch(Exception e){
    	con.closeConnection();  
    }
} 
%>